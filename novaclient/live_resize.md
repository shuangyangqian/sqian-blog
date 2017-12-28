在novaclient中新添加一个命令live_resize
========================

1:novaclient/v2/shell.py中添加

    @utils.arg('server', metavar='<server>', help=_('Name or ID of server.'))
    @utils.arg(
    'flavor',
    metavar='<flavor>',
    help=_("Name or ID of new flavor."))
    def do_live_resize(cs, args):
        """Live_resize a server."""
        server = _find_server(cs, args.server)
        flavor = _find_flavor(cs, args.flavor)
        kwargs = utils.get_resource_manager_extra_kwargs(do_live_resize, args)
        server.live_resize(flavor, **kwargs)

2.novaclient/v2/servers.py中的server类下添加函数def live_resize():

    def live_resize(self, flavor, **kwargs):
        """
        Live_resize the server's resources.

        :param flavor: the :class:`Flavor` (or its ID) to live_resize to.
        :return: An instance of novaclient.base.TupleWithMeta

        Live resize a server, in this process the vm wouldn't shutdown.
        """

        return self.manager.live_resize(self, flavor, **kwargs)

3.novaclient/v2/servers.py中的servermanager类下添加函数def live_resize():

    def live_resize(self, server, flavor, **kwargs):
        """
        Live_resize a server's resources.

        :param server: The :class:`Server` (or its ID) to share onto.
        :param flavor: The :class:`Flavor` (or its ID) to resize to.
        :return: An instance of novaclient.base.TupleWithMeta

        Live resize a server, in this process the vm wouldn't shutdown.
        """

        info = {'flavorRef': base.getid(flavor)}
        return self._action('live_resize', server, info=info, **kwargs)
