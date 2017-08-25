# 添加tempest plugin官方文档翻译 #

简介：tempest向外暴露一个插件API，允许所有人添加插件来作为tempest run的一部分来运行，这就使得一些项目利用插件来运行tempest测试，而不是将必须得把测试放到tempest项目中去。

## 创建一个插件 ##

创建一个plugin是简单直接的，除了需要引入一些tempest.lib的包之外不需要做额外的一些工作。但是tempest暴露出来的一些接口并不是非常稳定。除了明确指出的不需要从tempest引入任何东西。

**一些稳定的API：**

tempest还是提供了一些稳定的API接口可供使用：

    tempest.lib.*
    tempest.config
    tempest.test_discover.plugins
    tempest.common.credentials_factory

如果上述所提供的API并不能满足你现在所需要的，或者说你的项目中必须依靠其他一些API。那么tempest可能需要迁移，这时候，请file bug ，并且提交patch，加快把API走向趋于稳定的过程。

**插件制作：**

如果你想直接产生插件的基本结构并且继承自tempest，并且生成对应的目录，那么你可以使用tempest-plugin-cookiecutter。

    > pip install -U cookiecutter && cookiecutter https://git.openstack.org/openstack/tempest-plugin-cookiecutter
	
	Cloning into 'tempest-plugin-cookiecutter'...
	remote: Counting objects: 17, done.
	remote: Compressing objects: 100% (13/13), done.
	remote: Total 17 (delta 1), reused 14 (delta 1)
	Unpacking objects: 100% (17/17), done.
	Checking connectivity... done.
	project (default is "sample")? foo
	testclass (default is "SampleTempestPlugin")? FooTempestPlugin

按照上述步骤，会创建一个名为foo_tempest_plugin/的文件夹，里面包含了一些基本的文件和classes，你只需要创建或者移动你的测试用例至foo_tempest_pluigin/tests文件夹即可。

**入口：**


一旦你创建了你的插件，你需要创建一个入口来告诉tempest这个插件的位置。入口必须被添加到名字空间为tempest.test_plugin内。如果你使用的是pbr，那么这将变得非常简单，只需要在setup.cfg中添加如下即可：

    [entry_points]
	tempest.test_plugins =
    plugin_name = module.path:PluginClass

**Standalone Plugin vs In-repo Plugin**

Since all that's required for a plugin to be detected by tempest is a valid setuptools entry point in the proper namespace there is no difference from the tempest perspective on either creating a separate python package to house the plugin or adding the code to an existing python project. However, there are tradeoffs to consider when deciding which approach to take when creating a new plugin.

If you create a separate python project for your plugin this makes a lot of things much easier. Firstly it makes packaging and versioning much simpler, you can easily decouple the requirements for the plugin from the requirements for the other project. It lets you version the plugin independently and maintain a single version of the test code across project release boundaries (see the Branchless Tempest Spec for more details on this). It also greatly simplifies the install time story for external users. Instead of having to install the right version of a project in the same python namespace as tempest they simply need to pip install the plugin in that namespace. It also means that users don't have to worry about inadvertently installing a tempest plugin when they install another package.

The sole advantage to integrating a plugin into an existing python project is that it enables you to land code changes at the same time you land test changes in the plugin. This reduces some of the burden on contributors by not having to land 2 changes to add a new API feature and then test it and doing it as a single combined commit.


## Plugin Class ##

为了提供tempest所需要的参数和让tempest来运行你的插件，需要创建一个plugin class，当tempest需要的时候加载和调用它。为了使得这一过程简化，tempest提供了一个抽象类来充当你创建的class的父类。使用方法如下：

    from tempest.test_discover import plugins

	class MyPlugin(plugins.TempestPlugin):

然后你得确保你本地定义了抽象类中所有强制要求的方法，你可以参考参考文件中的API。

**Abstract Plugin Class**

class TempestPlugin[source]
 	
	class TempestPlugin[source]

    Provide basic hooks for an external plugin

    To provide tempest the necessary information to run the plugin.

    get_opt_lists()[source]¶

        Get a list of options for sample config generation
        Return option_list:
         	A list of tuples with the group name and options in that group.
        Return type:	list

Example:

    # Config options are defined in a config.py module
	service_option = cfg.BoolOpt(
    "my_service", default=True,
    help="Whether or not my service is available")

	my_service_group = cfg.OptGroup(name="my-service",
                                title="My service options")
	my_service_features_group = cfg.OptGroup(
    name="my-service-features",
    title="My service available features")

	MyServiceGroup = [<list of options>]
	MyServiceFeaturesGroup = [<list of options>]

	# Plugin is implemented in a plugin.py module
	from my_plugin import config as my_config

	def get_opt_lists(self, conf):
    return [
        (my_service_group.name, MyServiceGroup),
        (my_service_features_group.name, MyServiceFeaturesGroup)
    ]


 get_service_clients()[source]

	get_service_clients()[source]

    Get a list of the service clients for registration

    If the plugin implements service clients for one or more APIs, it may return their details by this method for automatic registration in any ServiceClients object instantiated by tests. The default implementation returns an empty list.
    Returns:	Each element of the list represents the service client for an API. Each dict must define all parameters required for the invocation of service_clients.ServiceClients.register_service_client_module.
    Return type:	list of dictionaries


Example implementation with one service client:

	def get_service_clients(self):
    # Example implementation with one service client
    myservice_config = config.service_client_config('myservice')
    params = {
        'name': 'myservice',
        'service_version': 'myservice',
        'module_path': 'myservice_tempest_tests.services',
        'client_names': ['API1Client', 'API2Client'],
    }
    params.update(myservice_config)
    return [params]

Example implementation with two service clients:

	def get_service_clients(self):
    # Example implementation with two service clients
    foo1_config = config.service_client_config('foo')
    params_foo1 = {
        'name': 'foo_v1',
        'service_version': 'foo.v1',
        'module_path': 'bar_tempest_tests.services.foo.v1',
        'client_names': ['API1Client', 'API2Client'],
    }
    params_foo1.update(foo_config)
    foo2_config = config.service_client_config('foo')
    params_foo2 = {
        'name': 'foo_v2',
        'service_version': 'foo.v2',
        'module_path': 'bar_tempest_tests.services.foo.v2',
        'client_names': ['API1Client', 'API2Client'],
    }
    params_foo2.update(foo2_config)
    return [params_foo1, params_foo2]

 load_tests()[source]¶

Return the information necessary to load the tests in the plugin.
Returns:	a tuple with the first value being the
test_dir and the second being the top_level
Return type:	tuple

register_opts(conf)[source]¶

Add additional configuration options to tempest.

This method will be run for the plugin during the register_opts() function in tempest.config.
Parameters:	conf (ConfigOpts) -- The conf object that can be used to register additional options on

Example:

	# Config options are defined in a config.py module
	service_option = cfg.BoolOpt(
    "my_service",
    default=True,
    help="Whether or not my service is available")

	# Note: as long as the group is listed in get_opt_lists,
	# it will be possible to access its optins in the plugin code
	# via ("-" in the group name are replaces with "_"):
	#     CONF.my_service.<option_name>
	my_service_group = cfg.OptGroup(name="my-service",
                                title="My service 	options")

	MyServiceGroup = [<list of options>]
	# (...) More groups and options...

	# Plugin is implemented in a plugin.py module
	from my_plugin import config as my_config

	def register_opts(self, conf):
    conf.register_opt(my_config.service_option,
                      group='service_available')
    conf.register_group(my_config.my_service_group)
    conf.register_opts(my_config.MyService +
                       my_config.my_service_group)

    conf.register_group(my_config.my_service_feature_group)
    conf.register_opts(my_config.MyServiceFeaturesGroup,
                       my_config.my_service_feature_group)

## 插件结构： ##

插件的常规的文件目录：

    plugin_dir/
  	  config.py
	  plugin.py
	  tests/
        api/
        scenario/
 	  services/
      client.py



config.py: 一些配置文件

plugin.py: 包含了plugin class

tests: 包含了所有的测试用例

services: 插件中client存放的位置

除此之外，在编写测试的时候，需要遵守code review规范，以使得你的测试能够很好的run起来。

**Dealing with configuration options**

Historically Tempest didn't provide external guarantees on its configuration options. However, with the introduction of the plugin interface this is no longer the case. An external plugin can rely on using any configuration option coming from Tempest, there will be at least a full deprecation cycle for any option before it's removed. However, just the options provided by Tempest may not be sufficient for the plugin. If you need to add any plugin specific configuration options you should use the register_opts and get_opt_lists methods to pass them to Tempest when the plugin is loaded. When adding configuration options the register_opts method gets passed the CONF object from tempest. This enables the plugin to add options to both existing sections and also create new configuration sections for new options.

**Service Clients**

如果在一个插件中你定义了一个service client，非常建议你实现plugin class中的get_service_clients方法。通过该API暴露出去的client都会被自动配置，并且可以被所有的service client class（定义在tempest.lib.services.clients.ServiceClients）的实例使用。万一注册了多个plugin，所有的service client都会被注册。下面给出get_service_client方法的实现例子：

    def get_service_clients(self):
    # Example implementation with two service clients
    my_service1_config = config.service_client_config('my_service')
    params_my_service1 = {
        'name': 'my_service_v1',
        'service_version': 'my_service.v1',
        'module_path': 'plugin_tempest_tests.services.my_service.v1',
        'client_names': ['API1Client', 'API2Client'],
    }
    params_my_service1.update(my_service_config)
    my_service2_config = config.service_client_config('my_service')
    params_my_service2 = {
        'name': 'my_service_v2',
        'service_version': 'my_service.v2',
        'module_path': 'plugin_tempest_tests.services.my_service.v2',
        'client_names': ['API1Client', 'API2Client'],
    }
    params_my_service2.update(my_service2_config)
    return [params_my_service1, params_my_service2]


参数解释：

name：用来从serviceclient进入clientFactory的参数名字。

service_version: Tempest enforces a single implementation for each service client. Available service clients are held in a ClientsRegistry singleton, and registered with service_version, which means that service_version must be unique and it should represent the service API and version implemented by the service client.

module_path: Relative to the service client module, from the root of the plugin.

client_names: Name of the classes that implement service clients in the service clients module.

**Example usage of the service clients in tests:**

    # my_creds is instance of tempest.lib.auth.Credentials
	# identity_uri is v2 or v3 depending on the configuration
	from tempest.lib.services import clients

	my_clients = clients.ServiceClients(my_creds, identity_uri)
	my_service1_api1_client = my_clients.my_service_v1.API1Client()
	my_service2_api1_client = my_clients.my_service_v2.API1Client(my_args='any')

Automatic configuration and registration of service clients imposes some extra constraints on the structure of the configuration options exposed by the plugin.

First service_version should be in the format service_config[.version]. The .version part is optional, and should only be used if there are multiple versions of the same API available. The service_config must match the name of a configuration options group defined by the plugin. Different versions of one API must share the same configuration group.

Second the configuration options group service_config must contain the following options:



1. catalog_type: corresponds to service in the catalog
2. endpoint_type
3. The following options will be honoured if defined, but they are not mandatory, as they do not necessarily apply to all service clients.
4. region: default to identity.region
5. build_timeout : default to compute.build_timeout 
6. build_interval: default to compute.build_interval


Third the service client classes should inherit from RestClient, should accept generic keyword arguments, and should pass those arguments to the __init__ method of RestClient. Extra arguments can be added. For instance:

    class MyAPIClient(rest_client.RestClient):

 	 def __init__(self, auth_provider, service, region,
              my_arg, my_arg2=True, **kwargs):
     super(MyAPIClient, self).__init__(
         auth_provider, service, region, **kwargs)
     self.my_arg = my_arg
     self.my_args2 = my_arg


Finally the service client should be structured in a python module, so that all service client classes are importable from it. Each major API version should have its own module.

The following folder and module structure is recommended for a single major API version:

    plugin_dir/
  	services/
    __init__.py
    client_api_1.py
    client_api_2.py

The content of __init__.py module should be:

    from client_api_1.py import API1Client
	from client_api_2.py import API2Client

	__all__ = ['API1Client', 'API2Client']	

The following folder and module structure is recommended for multiple major API version:

    plugin_dir/
  	services/
    v1/
       __init__.py
       client_api_1.py
       client_api_2.py
    v2/
       __init__.py
       client_api_1.py
       client_api_2.py

The content each of __init__.py module under vN should be:

    from client_api_1.py import API1Client
	from client_api_2.py import API2Client

	__all__ = ['API1Client', 'API2Client']

## Using Plugins ##

Tempest will automatically discover any installed plugins when it is run. So by just installing the python packages which contain your plugin you'll be using them with tempest, nothing else is really required.

However, you should take care when installing plugins. By their very nature there are no guarantees when running tempest with plugins enabled about the quality of the plugin. Additionally, while there is no limitation on running with multiple plugins it's worth noting that poorly written plugins might not properly isolate their tests which could cause unexpected cross interactions between plugins.

**Notes for using plugins with virtualenvs**

When using a tempest inside a virtualenv (like when running under tox) you have to ensure that the package that contains your plugin is either installed in the venv too or that you have system site-packages enabled. The virtualenv will isolate the tempest install from the rest of your system so just installing the plugin package on your system and then running tempest inside a venv will not work.

Tempest also exposes a tox job, all-plugin, which will setup a tox virtualenv with system site-packages enabled. This will let you leverage tox without requiring to manually install plugins in the tox venv before running tests.
