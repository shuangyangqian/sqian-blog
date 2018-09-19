





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  <link rel="dns-prefetch" href="https://assets-cdn.github.com">
  <link rel="dns-prefetch" href="https://avatars0.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars1.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars2.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars3.githubusercontent.com">
  <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
  <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">



  <link crossorigin="anonymous" media="all" integrity="sha512-Z0JAar9+DkI1NjGVdZr3GivARUgJtA0o2eHlTv7Ou2gshR5awWVf8QGsq11Ns9ZxQLEs+G5/SuARmvpOLMzulw==" rel="stylesheet" href="https://assets-cdn.github.com/assets/frameworks-95aff0b550d3fe338b645a4deebdcb1b.css" />
  <link crossorigin="anonymous" media="all" integrity="sha512-C6N00W0iP2oB+7G1Ky/7vUewo8ZDLWvsP4jCxLh7Oh5WDWqzcWI2dc/rBQF/KUVgnlJgdnzx8Q7d14ukpUMIdA==" rel="stylesheet" href="https://assets-cdn.github.com/assets/github-485942f0765a59298868de83961beb76.css" />
  
  
  <link crossorigin="anonymous" media="all" integrity="sha512-d05UAE+XVkB/QcOlIoZG4baBjaFk7r0bxQsoMDA9YoDT6dANlLJWPUdm/SoxXImWvhlLa9sPgUy4wtTzU5rBww==" rel="stylesheet" href="https://assets-cdn.github.com/assets/site-1004791ce103b39207617406c2b25111.css" />
  

  <meta name="viewport" content="width=device-width">
  
  <title>build-web-application-with-golang/08.1.md at master · astaxie/build-web-application-with-golang · GitHub</title>
    <meta name="description" content="A golang ebook intro how to build a web with golang - astaxie/build-web-application-with-golang">
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
  <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
  <meta property="fb:app_id" content="1401488693436528">

    
    <meta property="og:image" content="https://avatars2.githubusercontent.com/u/233907?s=400&amp;v=4" /><meta property="og:site_name" content="GitHub" /><meta property="og:type" content="object" /><meta property="og:title" content="astaxie/build-web-application-with-golang" /><meta property="og:url" content="https://github.com/astaxie/build-web-application-with-golang" /><meta property="og:description" content="A golang ebook intro how to build a web with golang - astaxie/build-web-application-with-golang" />

  <link rel="assets" href="https://assets-cdn.github.com/">
  
  <meta name="pjax-timeout" content="1000">
  
  <meta name="request-id" content="3201:128B:E26732:168E0CE:5BA209A7" data-pjax-transient>


  

  <meta name="selected-link" value="repo_source" data-pjax-transient>

      <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-site-verification" content="GXs5KoUUkNCoaAZn7wPN-t01Pywp9M3sEjnt_3_ZWPc">

  <meta name="octolytics-host" content="collector.githubapp.com" /><meta name="octolytics-app-id" content="github" /><meta name="octolytics-event-url" content="https://collector.githubapp.com/github-external/browser_event" /><meta name="octolytics-dimension-request_id" content="3201:128B:E26732:168E0CE:5BA209A7" /><meta name="octolytics-dimension-region_edge" content="iad" /><meta name="octolytics-dimension-region_render" content="iad" />
<meta name="analytics-location" content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" />



    <meta name="google-analytics" content="UA-3769691-2">


<meta class="js-ga-set" name="dimension1" content="Logged Out">



  

      <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

      <meta name="expected-hostname" content="github.com">
    <meta name="js-proxy-site-detection-payload" content="MjY3ZTZhZmEwNmVkNWQ1MDliZDAwOWUxY2ZiMzQyMGMzNjNjY2ZlMmMwZjQxMWQ5N2Y4NDgyMjg5NTMwZWJjN3x7InJlbW90ZV9hZGRyZXNzIjoiMjIxLjIzOC4xNTEuMTMwIiwicmVxdWVzdF9pZCI6IjMyMDE6MTI4QjpFMjY3MzI6MTY4RTBDRTo1QkEyMDlBNyIsInRpbWVzdGFtcCI6MTUzNzM0NTk2MCwiaG9zdCI6ImdpdGh1Yi5jb20ifQ==">

    <meta name="enabled-features" content="DASHBOARD_V2_LAYOUT_OPT_IN,EXPLORE_DISCOVER_REPOSITORIES,UNIVERSE_BANNER,MARKETPLACE_PLAN_RESTRICTION_EDITOR,QUOTE_MARKDOWN">

  <meta name="html-safe-nonce" content="78422589298aa172ece2fabb6a7cc7e594ca052e">

  <meta http-equiv="x-pjax-version" content="069fa7aa1a65c387901406ae33600fed">
  

      <link href="https://github.com/astaxie/build-web-application-with-golang/commits/master.atom" rel="alternate" title="Recent Commits to build-web-application-with-golang:master" type="application/atom+xml">

  <meta name="go-import" content="github.com/astaxie/build-web-application-with-golang git https://github.com/astaxie/build-web-application-with-golang.git">

  <meta name="octolytics-dimension-user_id" content="233907" /><meta name="octolytics-dimension-user_login" content="astaxie" /><meta name="octolytics-dimension-repository_id" content="5271882" /><meta name="octolytics-dimension-repository_nwo" content="astaxie/build-web-application-with-golang" /><meta name="octolytics-dimension-repository_public" content="true" /><meta name="octolytics-dimension-repository_is_fork" content="false" /><meta name="octolytics-dimension-repository_network_root_id" content="5271882" /><meta name="octolytics-dimension-repository_network_root_nwo" content="astaxie/build-web-application-with-golang" /><meta name="octolytics-dimension-repository_explore_github_marketplace_ci_cta_shown" content="false" />


    <link rel="canonical" href="https://github.com/astaxie/build-web-application-with-golang/blob/master/zh/08.1.md" data-pjax-transient>


  <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">

  <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">

  <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#000000">
  <link rel="icon" type="image/x-icon" class="js-site-favicon" href="https://assets-cdn.github.com/favicon.ico">

<meta name="theme-color" content="#1e2327">



  <link rel="manifest" href="/manifest.json" crossOrigin="use-credentials">

  </head>

  <body class="logged-out env-production page-blob">
    

  <div class="position-relative js-header-wrapper ">
    <a href="#start-of-content" tabindex="1" class="px-2 py-4 bg-blue text-white show-on-focus js-skip-to-content">Skip to content</a>
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"><div class="progress"></div></div>

    
    
    



        

  <header class="Header header-logged-out  position-relative f4 py-3" role="banner" data-ga-load="(Logged out) Header, view, experiment:site_header_dropdowns; group:dropdowns">
    <div class="container-lg d-flex px-3">
      <div class="d-flex flex-justify-between flex-items-center">
          <a class="mr-5" href="https://github.com/" aria-label="Homepage" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark; experiment:site_header_dropdowns; group:dropdowns">
            <svg height="32" class="octicon octicon-mark-github text-white" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
          </a>
      </div>

      <div class="HeaderMenu HeaderMenu--experiment d-flex flex-justify-between flex-items-center flex-auto">
        <div class="d-none">
          <button class="btn-link js-details-target" type="button" aria-label="Toggle navigation" aria-expanded="false">
            <svg height="24" class="octicon octicon-x text-gray" viewBox="0 0 12 16" version="1.1" width="18" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
          </button>
        </div>

          <nav class="">
            <ul class="d-flex list-style-none">
                <li class="HeaderMenu-item dropdown mr-5">
                  <details class="details-expanded details-reset js-dropdown-details ">
                    <summary class="HeaderMenu-target text-white">
                      <div class="d-flex flex-items-baseline flex-justify-between">
                        <span class="d-inline-block mr-1">Features</span>
                        <span class="dropdown-caret"></span>
                      </div>
                    </summary>
                    <div class="dropdown-menu dropdown-menu-s p-4 ml-n4 mt-3 mt-lg-2">
                      <a href="/features" class="d-block d-lg-flex flex-items-center flex-justify-between f5 link-gray-dark text-bold mb-2" data-ga-click="(Logged out) Header, go to Features, experiment:site_header_dropdowns; group:dropdowns"><span>Features overview</span> <svg height="16" class="octicon octicon-chevron-right text-gray-dark" viewBox="0 0 8 16" version="1.1" width="8" aria-hidden="true"><path fill-rule="evenodd" d="M7.5 8l-5 5L1 11.5 4.75 8 1 4.5 2.5 3l5 5z"/></svg></a>
                      <hr class="border border-dashed my-3 d-none d-lg-block">
                      <ul class="list-style-none f5">
                        <li class="mb-2"><a href="/features/code-review/" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Code review, experiment:site_header_dropdowns; group:dropdowns">Code review</a></li>
                        <li class="mb-2"><a href="/features/project-management/" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Project management, experiment:site_header_dropdowns; group:dropdowns">Project management</a></li>
                        <li class="mb-2"><a href="/features/integrations" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Integrations, experiment:site_header_dropdowns; group:dropdowns">Integrations</a></li>
                        <li class="mb-2"><a href="/features#team-management" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Team management, experiment:site_header_dropdowns; group:dropdowns">Team management</a></li>
                        <li class="mb-2"><a href="/features#social-coding" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Social coding, experiment:site_header_dropdowns; group:dropdowns">Social coding</a></li>
                        <li class="mb-2"><a href="/features#documentation" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Documentation, experiment:site_header_dropdowns; group:dropdowns">Documentation</a></li>
                        <li class="mb-2"><a href="/features#code-hosting" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Code hosting, experiment:site_header_dropdowns; group:dropdowns">Code hosting</a></li>
                      </ul>
                    </div>
                  </details>
                </li>
                <li class="HeaderMenu-item dropdown platform-nav mr-5">
                  <details class="details-expanded details-reset js-dropdown-details ">
                    <summary class="HeaderMenu-target text-white">
                      <div class="d-flex flex-items-baseline flex-justify-between">
                        <span class="d-inline-block mr-1">Platform</span>
                        <span class="dropdown-caret"></span>
                      </div>
                    </summary>
                    <div class="dropdown-menu dropdown-menu-s p-4 ml-n4 mt-3 mt-lg-2">
                      <div class="d-flex gutter-spacious ">
                        <div class="position-relative col-8">
                          <dl class="my-0">
                            <a href="/marketplace" class="d-flex mb-3 link-gray-dark no-underline" data-ga-click="(Logged out) Header, go to Marketplace, experiment:site_header_dropdowns; group:dropdowns">
                              <div class="mr-3">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70.92 56.98" class="d-block" width="34"><title>Asset 1</title><g data-name="Layer 2"><path d="M6.18 57H1a1 1 0 0 1 0-2h5.18a1 1 0 0 1 0 2zM69.92 57h-5.18a1 1 0 1 1 0-2h5.18a1 1 0 0 1 0 2z" fill="#2088ff"></path><path d="M29.67 56.47a1 1 0 0 1-1-1V34.84H16v20.23a1 1 0 0 1-2 0V33.84a1 1 0 0 1 1-1h14.67a1 1 0 0 1 1 1v21.63a1 1 0 0 1-1 1z" fill="#79b8ff"></path><path d="M64.74 57H6.18a1 1 0 0 1-1-1v-8.65a1 1 0 0 1 2 0V55h56.56V33.84a1 1 0 0 1 2 0V56a1 1 0 0 1-1 1zM6.18 41.24a1 1 0 0 1-1-1V1a1 1 0 0 1 1-1h58.58a1 1 0 0 1 1 1v10.52a1 1 0 1 1-2 0V2H7.18v38.24a1 1 0 0 1-1 1z" fill="#2088ff"></path><path d="M56.82 45.94H36.34a1 1 0 0 1-1-1v-11.1a1 1 0 0 1 1-1h20.48a1 1 0 0 1 1 1v11.1a1 1 0 0 1-1 1zm-19.48-2h18.48v-9.1H37.34z" fill="#79b8ff"></path><path d="M31.55 27.5a7.84 7.84 0 0 1-5.21-2.42c-1.06-1-11.87-9.74-12-9.83a1 1 0 0 1 .66-1.78h43.66a1 1 0 0 1 .64.24l11.26 9.48a1 1 0 0 1-1.29 1.53l-11-9.25H17.81c3.26 2.65 9.08 7.4 9.88 8.12a6 6 0 0 0 3.87 1.9 3.3 3.3 0 0 0 3-1.95 1 1 0 1 1 1.82.82 5.3 5.3 0 0 1-4.83 3.14z" fill="#2088ff"></path><path d="M40.24 27.5a5.26 5.26 0 0 1-1.86-.34 1 1 0 0 1 .71-1.87 3.26 3.26 0 0 0 1.16.21 3.3 3.3 0 0 0 3-1.95 1 1 0 1 1 1.82.82 5.3 5.3 0 0 1-4.83 3.13zM48.82 27.5a5.26 5.26 0 0 1-1.82-.34 1 1 0 0 1 .71-1.87 3.26 3.26 0 0 0 1.16.21 3.3 3.3 0 0 0 3-1.95 1 1 0 1 1 1.82.82 5.3 5.3 0 0 1-4.87 3.13zM57.41 27.5a5.26 5.26 0 0 1-1.86-.34 1 1 0 0 1 .71-1.87 3.26 3.26 0 0 0 1.16.21 3.3 3.3 0 0 0 3-1.95 1 1 0 1 1 1.82.82 5.3 5.3 0 0 1-4.83 3.13zM66 27.5a5.26 5.26 0 0 1-1.86-.34 1 1 0 0 1 .71-1.87 3.26 3.26 0 0 0 1.15.21 3.3 3.3 0 0 0 3-2 1 1 0 0 1 1.82.82A5.31 5.31 0 0 1 66 27.5zM15 27.22a1 1 0 0 1-1-1V14.71a1 1 0 0 1 2 0v11.51a1 1 0 0 1-1 1z" fill="#2088ff"></path><path d="M44.16 25a1 1 0 0 1-.65-.24L38.07 20a1 1 0 0 1 1.3-1.52l5.43 4.67a1 1 0 0 1-.64 1.85zM35.52 25a1 1 0 0 1-.65-.24L29.44 20a1 1 0 0 1 1.3-1.52l5.43 4.67a1 1 0 0 1-.65 1.85zM52.74 25a1 1 0 0 1-.65-.24L46.66 20A1 1 0 0 1 48 18.53l5.43 4.67a1 1 0 0 1-.69 1.8zM61.33 25a1 1 0 0 1-.65-.24L55.25 20a1 1 0 0 1 1.3-1.52L62 23.2a1 1 0 0 1-.67 1.8zM22.23 8.42H6.51a1 1 0 0 1 0-2h15.72a1 1 0 0 1 0 2zM64.76 8.42H58.4a1 1 0 0 1 0-2h6.36a1 1 0 0 1 0 2z" fill="#2088ff"></path><path d="M46.58 45.72a1 1 0 0 1-1-1V34.1a1 1 0 0 1 2 0v10.62a1 1 0 0 1-1 1z" fill="#79b8ff"></path></g></svg>

                              </div>
                              <div>
                                <dt class="f4">Marketplace</dt>
                                <dd class="f6 text-gray">Find developer tools that work with GitHub</dd>
                              </div>
                            </a>
                            <a href="https://developer.github.com" class="d-flex mb-3 link-gray-dark no-underline" data-ga-click="(Logged out) Header, go to Developers, experiment:site_header_dropdowns; group:dropdowns">
                              <div class="mr-3">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 61.23 60.12" class="d-block" width="34"><title>Asset 1</title><g data-name="Layer 2"><path fill="none" stroke="#79b8ff" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2" d="M14.75 13.22H3.52M18.02 6.33H6.54"></path><path fill="none" stroke="#2088ff" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2" d="M56.96 51.89H45.73M60.23 44.99H48.75"></path><circle cx="22.5" cy="37.62" r="7.48" transform="rotate(-45 22.502 37.62)" fill="none" stroke="#2088ff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle><path d="M36.72 29.79l1.35 3.4 5.93 2V40l-5.92 2.08-1.44 3.39 2.83 5.58L36 54.54l-5.66-2.7L27 53.22l-2 5.9h-4.89L18 53.18l-3.36-1.4L9 54.58 5.58 51.1l2.7-5.66-1.38-3.37-5.9-2v-4.89l5.92-2.08 1.44-3.39-2.82-5.57L9 20.69l5.66 2.7L18 22l2-5.9h4.89L27 22l3.36 1.4L36 20.66l3.45 3.48z" fill="none" stroke="#2088ff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path><path d="M7.22 22.48L9 20.69l5.66 2.7L18 22l2-5.9h4.89L27 22l3.36 1.4L36 20.66l3.45 3.48-2.7 5.66 1.35 3.4 5.93 2L44 40l-5.92 2.08-1.44 3.39 2.83 5.58-1.83 1.82" fill="none" stroke="#2088ff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" opacity=".1"></path><path d="M37.22 14.11a6.05 6.05 0 1 1 8.56 8.56M30.07 12l-2.29-4.51 2.81-2.79 4.58 2.19 2.72-1.12L39.5 1h4l1.64 4.8 2.71 1.14 4.54-2.26 2.79 2.81L53 12.06l1.09 2.75 4.8 1.58v4L54.09 22l-1.16 2.74 2.29 4.51-2.82 2.83-4.58-2.19" fill="none" stroke="#79b8ff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path><path d="M29.14 6.14l1.45-1.44 4.58 2.19 2.72-1.12L39.5 1h4l1.64 4.8 2.71 1.14 4.54-2.26 2.79 2.81L53 12.06l1.09 2.75 4.8 1.58v4L54.09 22l-1.16 2.74 2.29 4.51-1.48 1.47" fill="none" stroke="#79b8ff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" opacity=".1"></path></g></svg>

                              </div>
                              <div>
                                <dt class="f4">GitHub API</dt>
                                <dd class="f6 text-gray">Start building on the GitHub platform</dd>
                              </div>
                            </a>
                            <a href="https://partner.github.com/?source=github-header-loggedout&experiment=site_header_dropdowns&group=dropdowns" class="d-flex mb-3 link-gray-dark no-underline" data-ga-click="(Logged out) Header, go to Partner program, experiment:site_header_dropdowns; group:dropdowns">
                              <div class="mr-3">
                                <!-- Generator: Adobe Illustrator 22.1.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  --><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 37 23" style="enable-background:new 0 0 37 23;" xml:space="preserve" class="d-block" width="34">
<style type="text/css">
	.st0{fill:none;stroke:#79B8FF;stroke-linecap:round;stroke-linejoin:round;}
	.st1{fill:none;stroke:#2088FF;stroke-linecap:round;stroke-linejoin:round;}
</style>
<path class="st0" d="M6,1l4.5,1.4L5.3,15.2L1,12.9L6,1z"></path>
<path class="st1" d="M30.9,1.2L36,12.8l-3.9,2.6l-5.2-13L30.9,1.2z"></path>
<path class="st1" d="M5.2,11.7c0-0.6-0.5-1-1-1c-0.6,0-1,0.5-1,1c0,0.6,0.5,1,1,1"></path>
<path class="st0" d="M29.7,4.6c0.4,0,0.8-0.3,0.8-0.8v0c0-0.4-0.3-0.8-0.8-0.8h0c-0.4,0-0.8,0.3-0.8,0.8v0C29,4.3,29.3,4.6,29.7,4.6  L29.7,4.6z"></path>
<path class="st0" d="M6.2,13.4c0,0,2.4,0.8,3.9,2.3L6.2,13.4z M9.6,4.8c0,0,4.3,2.3,6.9,2.8L9.6,4.8z"></path>
<path class="st1" d="M30.4,11.5l-3.2,2.6"></path>
<path class="st0" d="M19.7,9l8.7,6.2c0.4,0.3,1.1,1.2,0.4,2.2c-0.7,0.9-1.5,0.2-1.5,0.2l-6-4.2"></path>
<path class="st1" d="M27.5,4.8c0,0-2,1.6-3.3,1.4c-1.3-0.2-4.7-0.9-4.7-0.9c-0.7,0.8-3.7,3.5-4.6,3.6c0,0-0.2,1.5,1.6,1.3  c1.7-0.2,2.7-0.9,3.7-1.7"></path>
<path class="st0" d="M24.6,18.9c0,0,0.2,0.9-0.2,1.4c-0.2,0.3-0.7,0.6-1.3,0.3l-3.7-2.5L24.6,18.9z M27.1,17.6c0,0,0.1,0.9-0.5,1.4  c-0.3,0.3-0.8,0.6-1.5,0.3l-5.9-4.3L27.1,17.6z"></path>
<path class="st0" d="M22.4,20.1c0,0,0,0.6-0.2,1.1c-0.2,0.3-0.4,0.6-1.1,0.4l-2.8-1.9"></path>
<path class="st1" d="M17.8,17c0.3-0.3,1.6-0.2,1.4,1c-0.3,1.2-1.7,2.4-2.1,2.6c-0.4,0.2-1.4,0.2-1.4-0.7L17.8,17z M14.3,14.6  c0,0-0.7-1.5-1.5-1.2c-0.8,0.3-2.8,2-2.8,2.7c0,0.7,1,1.5,1.9,0.8L14.3,14.6z"></path>
<path class="st1" d="M16.1,15.8c0.2-0.3,1.8-0.4,1.5,1.1c-0.3,1.4-2.1,2.7-2.4,2.9c-0.3,0.1-1.7,0.3-1.9-0.9"></path>
<path class="st1" d="M15.9,16.1c0,0,0.5-0.9-0.1-1.5c-0.6-0.6-1.2-0.2-1.6,0.2c-0.3,0.3-2.9,2.8-2.9,2.8s0.5,1.8,1.7,1.3  C14.2,18.5,15.9,16.1,15.9,16.1z"></path>
</svg>

                              </div>
                              <div>
                                <dt class="f4">Partner program</dt>
                                <dd class="f6 text-gray">Help millions of developers do their best work</dd>
                              </div>
                            </a>
                          </dl>
                          <div class="d-none d-lg-block border-left position-absolute top-0 right-0 bottom-0"></div>
                        </div>
                        <div class="col-4">
                          <strong class="d-block f5 text-bold mb-2 text-gray-dark">Apps by GitHub</strong>
                          <ul class="list-style-none f5">
                            <li class="mb-2"><a href="https://desktop.github.com/" class="link-gray" data-ga-click="(Logged out) Header, go to Desktop, experiment:site_header_dropdowns; group:dropdowns">Desktop <span style="color: #959da5;">&#8599;</span></a></li>
                            <li class="mb-2"><a href="https://atom.io/" class="link-gray" data-ga-click="(Logged out) Header, go to Atom, experiment:site_header_dropdowns; group:dropdowns">Atom <span style="color: #959da5;">&#8599;</span></a></li>
                            <li class="mb-2"><a href="https://visualstudio.github.com/" class="link-gray" data-ga-click="(Logged out) Header, go to Visual Studio, experiment:site_header_dropdowns; group:dropdowns">Visual Studio <span style="color: #959da5;">&#8599;</span></a></li>
                            <li class="mb-2"><a href="https://unity.github.com/" class="link-gray" data-ga-click="(Logged out) Header, go to Unity Extension, experiment:site_header_dropdowns; group:dropdowns">Unity Extension <span style="color: #959da5;">&#8599;</span></a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </details>
                </li>
                <li class="HeaderMenu-item dropdown mr-5">
                  <details class="details-expanded details-reset js-dropdown-details ">
                    <summary class="HeaderMenu-target text-white">
                      <div class="d-flex flex-items-baseline flex-justify-between">
                        <span class="d-inline-block mr-1">Business</span>
                        <span class="dropdown-caret"></span>
                      </div>
                    </summary>
                    <div class="dropdown-menu dropdown-menu-s p-4 ml-n4 mt-3 mt-lg-2">
                      <a href="/business" class="d-block d-lg-flex flex-items-center flex-justify-between f5 link-gray-dark text-bold mb-2" data-ga-click="(Logged out) Header, go to Business, experiment:site_header_dropdowns; group:dropdowns"><span>Business overview</span> <svg height="16" class="octicon octicon-chevron-right text-gray-dark" viewBox="0 0 8 16" version="1.1" width="8" aria-hidden="true"><path fill-rule="evenodd" d="M7.5 8l-5 5L1 11.5 4.75 8 1 4.5 2.5 3l5 5z"/></svg></a>
                      <hr class="border border-dashed my-3 d-none d-lg-block">
                      <ul class="list-style-none f5">
                        <li class="mb-2"><a href="/business/customers" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Customers, experiment:site_header_dropdowns; group:dropdowns">Customers</a></li>
                        <li class="mb-2"><a href="/business/security" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Security, experiment:site_header_dropdowns; group:dropdowns">Security</a></li>
                        <li class="mb-2"><a href="https://enterprise.github.com/contact" class="d-block link-gray" data-ga-click="(Logged out) Header, go to Contact, experiment:site_header_dropdowns; group:dropdowns">Contact</a></li>
                      </ul>
                    </div>
                  </details>
                </li>

                <li class="HeaderMenu-item dropdown mr-5">
                  <details class="details-expanded details-reset js-dropdown-details ">
                    <summary class="HeaderMenu-target text-white">
                      <div class="d-flex flex-items-baseline flex-justify-between">
                        <span class="d-inline-block mr-1">Explore</span>
                        <span class="dropdown-caret"></span>
                      </div>
                    </summary>
                    <div class="dropdown-menu dropdown-menu-s p-4 ml-n4 mt-3 mt-lg-2">
                      <ul class="list-style-none f5">
                        <li class="mb-2"><a href="/explore" class="d-lg-flex flex-items-center flex-justify-between link-gray-dark text-bold" data-ga-click="(Logged out) Header, go to Explore GitHub, experiment:site_header_dropdowns; group:dropdowns"><span>Explore GitHub</span> <svg height="16" class="octicon octicon-chevron-right text-gray-dark" viewBox="0 0 8 16" version="1.1" width="8" aria-hidden="true"><path fill-rule="evenodd" d="M7.5 8l-5 5L1 11.5 4.75 8 1 4.5 2.5 3l5 5z"/></svg></a></li>
                        <li class="mb-3"><a href="/trending" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Trending, experiment:site_header_dropdowns; group:dropdowns">Trending</a></li>
                      </ul>

                      <hr class="border border-dashed my-3 d-none d-lg-block">

                      <strong class="d-block f5 text-bold mb-2 text-gray-dark">Learn</strong>
                      <ul class="list-style-none f5">
                        <li class="mb-2"><a href="/topics" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Topics, experiment:site_header_dropdowns; group:dropdowns">Topics</a></li>
                        <li class="mb-2"><a href="/collections" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Collections, experiment:site_header_dropdowns; group:dropdowns">Collections</a></li>
                        <li class="mb-2"><a href="https://lab.github.com/" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Learning Lab, experiment:site_header_dropdowns; group:dropdowns">Learning Lab <span style="color: #959da5;">&#8599;</span></a></li>
                        <li class="mb-3"><a href="https://opensource.guide/" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Open source guides, experiment:site_header_dropdowns; group:dropdowns">Open source guides <span style="color: #959da5;">&#8599;</span></a></li>
                      </ul>

                      <hr class="border border-dashed my-3 d-none d-lg-block">

                      <strong class="d-block f5 text-bold mb-2 text-gray-dark">Connect</strong>
                      <ul class="list-style-none f5">
                        <li class="mb-2"><a href="/events" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Events, experiment:site_header_dropdowns; group:dropdowns">Events</a></li>
                        <li class="mb-2"><a href="https://github.community/" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Community forum, experiment:site_header_dropdowns; group:dropdowns">Community forum <span style="color: #959da5;">&#8599;</span></a></li>
                        <li class="mb-3"><a href="https://education.github.community/" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Education community, experiment:site_header_dropdowns; group:dropdowns">Education community <span style="color: #959da5;">&#8599;</span></a></li>
                      </ul>
                    </div>
                  </details>
                </li>

                <li class="HeaderMenu-item dropdown mr-5">
                  <details class="details-expanded details-reset js-dropdown-details ">
                    <summary class="HeaderMenu-target text-white">
                      <div class="d-flex flex-items-baseline flex-justify-between">
                        <span class="d-inline-block mr-1">Pricing</span>
                        <span class="dropdown-caret"></span>
                      </div>
                    </summary>
                    <div class="dropdown-menu dropdown-menu-s p-4 ml-n4 mt-3 mt-lg-2">
                      <a href="/pricing" class="d-block d-lg-flex flex-items-center flex-justify-between f5 link-gray-dark text-bold mb-3" data-ga-click="(Logged out) Header, go to Pricing, experiment:site_header_dropdowns; group:dropdowns"><span>Pricing overview</span> <svg height="16" class="octicon octicon-chevron-right text-gray-dark" viewBox="0 0 8 16" version="1.1" width="8" aria-hidden="true"><path fill-rule="evenodd" d="M7.5 8l-5 5L1 11.5 4.75 8 1 4.5 2.5 3l5 5z"/></svg></a>
                      <hr class="border border-dashed my-3 d-none d-lg-block">
                      <strong class="d-block f5 text-bold text-gray-dark mb-2">Plans</strong>
                      <ul class="list-style-none f5">
                        <li class="mb-2"><a href="/pricing/developer" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Developer, experiment:site_header_dropdowns; group:dropdowns">Developer</a></li>
                        <li class="mb-2"><a href="/pricing/team" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Team, experiment:site_header_dropdowns; group:dropdowns">Team</a></li>
                        <li class="mb-2"><a href="/pricing/business-hosted" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Business, experiment:site_header_dropdowns; group:dropdowns">Business</a></li>
                        <li class="mb-3"><a href="/pricing#feature-comparison" class="link-gray d-block" data-ga-click="(Logged out) Header, go to Compare plans, experiment:site_header_dropdowns; group:dropdowns">Compare plans</a></li>
                      </ul>
                      <hr class="border border-dashed my-3 d-none d-lg-block">
                      <ul class="list-style-none f5">
                        <li class="mb-2"><a href="https://github.com/nonprofit" class="link-gray-dark" data-ga-click="(Logged out) Header, go to Nonprofits, experiment:site_header_dropdowns; group:dropdowns">Nonprofits</a></li>
                        <li class="mb-2"><a href="https://education.github.com/discount_requests/new" class="link-gray-dark" data-ga-click="(Logged out) Header, go to Education, experiment:site_header_dropdowns; group:dropdowns">Education <span style="color: #959da5;">&#8599;</span></a></li>
                      </ul>
                    </div>
                  </details>
                </li>
            </ul>
          </nav>

        <div class="d-flex flex-items-center">
            <div class="d-flex mr-3 flex-items-center">
              <div class="header-search scoped-search site-scoped-search js-site-search position-relative js-jump-to"
  role="combobox"
  aria-owns="jump-to-results"
  aria-label="Search or jump to"
  aria-haspopup="listbox"
  aria-expanded="false"
>
  <div class="position-relative">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-site-search-form" data-scope-type="Repository" data-scope-id="5271882" data-scoped-search-url="/astaxie/build-web-application-with-golang/search" data-unscoped-search-url="/search" action="/astaxie/build-web-application-with-golang/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
      <label class="form-control header-search-wrapper header-search-wrapper-jump-to position-relative d-flex flex-justify-between flex-items-center js-chromeless-input-container">
        <input type="text"
          class="form-control header-search-input jump-to-field js-jump-to-field js-site-search-focus js-site-search-field is-clearable"
          data-hotkey="s,/"
          name="q"
          value=""
          placeholder="Search"
          data-unscoped-placeholder="Search GitHub"
          data-scoped-placeholder="Search"
          autocapitalize="off"
          aria-autocomplete="list"
          aria-controls="jump-to-results"
          data-jump-to-suggestions-path="/_graphql/GetSuggestedNavigationDestinations#csrf-token=1G7IdgSP2OKDcdDBvdRrj00xieKIZlgLpoOkUY5AETRN5bQkobxj8Uc30P1HDC8cWjBusN2bgbrqsCWZ3eMrlQ=="
          spellcheck="false"
          autocomplete="off"
          >
          <input type="hidden" class="js-site-search-type-field" name="type" >
            <img src="https://assets-cdn.github.com/images/search-shortcut-hint.svg" alt="" class="mr-2 header-search-key-slash">

            <div class="Box position-absolute overflow-hidden d-none jump-to-suggestions js-jump-to-suggestions-container">
              <ul class="d-none js-jump-to-suggestions-template-container">
                <li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item" role="option">
                  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center p-2 jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open" href="">
                    <div class="jump-to-octicon js-jump-to-octicon mr-2 text-center d-none">
                      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
                      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
                      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
                    </div>

                    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

                    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
                    </div>

                    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
                      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
                        In this repository
                      </span>
                      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
                        All GitHub
                      </span>
                      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
                    </div>

                    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
                      Jump to
                      <span class="d-inline-block ml-1 v-align-middle">↵</span>
                    </div>
                  </a>
                </li>
              </ul>
              <ul class="d-none js-jump-to-no-results-template-container">
                <li class="d-flex flex-justify-center flex-items-center p-3 f5 d-none">
                  <span class="text-gray">No suggested jump to results</span>
                </li>
              </ul>

              <ul id="jump-to-results" role="listbox" class="js-navigation-container jump-to-suggestions-results-container js-jump-to-suggestions-results-container" >
                <li class="d-flex flex-justify-center flex-items-center p-0 f5">
                  <img src="https://assets-cdn.github.com/images/spinners/octocat-spinner-128.gif" alt="Octocat Spinner Icon" class="m-2" width="28">
                </li>
              </ul>
            </div>
      </label>
</form>  </div>
</div>

            </div>

          <a class="HeaderMenu-target text-white no-underline mr-3" href="/login?return_to=%2Fastaxie%2Fbuild-web-application-with-golang%2Fblob%2Fmaster%2Fzh%2F08.1.md" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in; experiment:site_header_dropdowns; group:dropdowns">Sign&nbsp;in</a>
            <a class="HeaderMenu-target d-inline-block text-white no-underline border border-gray-dark rounded-2 px-2 py-1" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up; experiment:site_header_dropdowns; group:dropdowns">Sign&nbsp;up</a>
        </div>
      </div>
    </div>
  </header>


  </div>

  <div id="start-of-content" class="show-on-focus"></div>

    <div id="js-flash-container">


</div>



  <div role="main" class="application-main ">
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode" class="">
    <div id="js-repo-pjax-container" data-pjax-container >
      







  <div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav  ">
    <div class="repohead-details-container clearfix container">

      <ul class="pagehead-actions">
  <li>
      <a href="/login?return_to=%2Fastaxie%2Fbuild-web-application-with-golang"
    class="btn btn-sm btn-with-count tooltipped tooltipped-s"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <svg class="octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
    Watch
  </a>
  <a class="social-count" href="/astaxie/build-web-application-with-golang/watchers"
     aria-label="2206 users are watching this repository">
    2,206
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fastaxie%2Fbuild-web-application-with-golang"
    class="btn btn-sm btn-with-count tooltipped tooltipped-s"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
    Star
  </a>

    <a class="social-count js-social-count" href="/astaxie/build-web-application-with-golang/stargazers"
      aria-label="25131 users starred this repository">
      25,131
    </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fastaxie%2Fbuild-web-application-with-golang"
        class="btn btn-sm btn-with-count tooltipped tooltipped-s"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <svg class="octicon octicon-repo-forked v-align-text-bottom" viewBox="0 0 10 16" version="1.1" width="10" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
        Fork
      </a>

    <a href="/astaxie/build-web-application-with-golang/network/members" class="social-count"
       aria-label="7212 users forked this repository">
      7,212
    </a>
  </li>
</ul>

      <h1 class="public ">
  <svg class="octicon octicon-repo" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
  <span class="author" itemprop="author"><a class="url fn" rel="author" href="/astaxie">astaxie</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a data-pjax="#js-repo-pjax-container" href="/astaxie/build-web-application-with-golang">build-web-application-with-golang</a></strong>

</h1>

    </div>
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax container"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a class="js-selected-navigation-item selected reponav-item" itemprop="url" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches repo_packages /astaxie/build-web-application-with-golang" href="/astaxie/build-web-application-with-golang">
      <svg class="octicon octicon-code" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a itemprop="url" data-hotkey="g i" class="js-selected-navigation-item reponav-item" data-selected-links="repo_issues repo_labels repo_milestones /astaxie/build-web-application-with-golang/issues" href="/astaxie/build-web-application-with-golang/issues">
        <svg class="octicon octicon-issue-opened" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"/></svg>
        <span itemprop="name">Issues</span>
        <span class="Counter">89</span>
        <meta itemprop="position" content="2">
</a>    </span>

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a data-hotkey="g p" itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_pulls checks /astaxie/build-web-application-with-golang/pulls" href="/astaxie/build-web-application-with-golang/pulls">
      <svg class="octicon octicon-git-pull-request" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
      <span itemprop="name">Pull requests</span>
      <span class="Counter">12</span>
      <meta itemprop="position" content="3">
</a>  </span>

    <a data-hotkey="g b" class="js-selected-navigation-item reponav-item" data-selected-links="repo_projects new_repo_project repo_project /astaxie/build-web-application-with-golang/projects" href="/astaxie/build-web-application-with-golang/projects">
      <svg class="octicon octicon-project" viewBox="0 0 15 16" version="1.1" width="15" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      Projects
      <span class="Counter" >0</span>
</a>

    <a class="js-selected-navigation-item reponav-item" data-hotkey="g w" data-selected-links="repo_wiki /astaxie/build-web-application-with-golang/wiki" href="/astaxie/build-web-application-with-golang/wiki">
      <svg class="octicon octicon-book" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M3 5h4v1H3V5zm0 3h4V7H3v1zm0 2h4V9H3v1zm11-5h-4v1h4V5zm0 2h-4v1h4V7zm0 2h-4v1h4V9zm2-6v9c0 .55-.45 1-1 1H9.5l-1 1-1-1H2c-.55 0-1-.45-1-1V3c0-.55.45-1 1-1h5.5l1 1 1-1H15c.55 0 1 .45 1 1zm-8 .5L7.5 3H2v9h6V3.5zm7-.5H9.5l-.5.5V12h6V3z"/></svg>
      Wiki
</a>
  <a class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors dependency_graph pulse /astaxie/build-web-application-with-golang/pulse" href="/astaxie/build-web-application-with-golang/pulse">
    <svg class="octicon octicon-graph" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"/></svg>
    Insights
</a>

</nav>


  </div>

<div class="container new-discussion-timeline experiment-repo-nav  ">
  <div class="repository-content ">

    
  <a class="d-none js-permalink-shortcut" data-hotkey="y" href="/astaxie/build-web-application-with-golang/blob/0246e4487244a2a13867ad0e90d0c345b5264d28/zh/08.1.md">Permalink</a>

  <!-- blob contrib key: blob_contributors:v21:71e8834bbd1018895f94fe291ac9fe58 -->

      <div class="signup-prompt-bg rounded-1">
      <div class="signup-prompt p-4 text-center mb-4 rounded-1">
        <div class="position-relative">
          <!-- '"` --><!-- </textarea></xmp> --></option></form><form action="/site/dismiss_signup_prompt" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="GwVAMyxZC6InfemA79wqqDvG7MephPOtqLqVuVO9OEt4RZgmcLCv6JUh+cL74HJKtQhR4E3iUF1z/Rjgkbp6RA==" />
            <button type="submit" class="position-absolute top-0 right-0 btn-link link-gray" data-ga-click="(Logged out) Sign up prompt, clicked Dismiss, text:dismiss">
              Dismiss
            </button>
</form>          <h3 class="pt-2">Join GitHub today</h3>
          <p class="col-6 mx-auto">GitHub is home to over 28 million developers working together to host and review code, manage projects, and build software together.</p>
          <a class="btn btn-primary" href="/join?source=prompt-blob-show" data-ga-click="(Logged out) Sign up prompt, clicked Sign up, text:sign-up">Sign up</a>
        </div>
      </div>
    </div>


  <div class="file-navigation">
    
<div class="select-menu branch-select-menu js-menu-container js-select-menu float-left">
  <button class=" btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    
    type="button" aria-label="Switch branches or tags" aria-expanded="false" aria-haspopup="true">
      <i>Branch:</i>
      <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <svg class="octicon octicon-x js-menu-close" role="img" aria-label="Close" viewBox="0 0 12 16" version="1.1" width="12" height="16"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/astaxie/build-web-application-with-golang/blob/master/zh/08.1.md"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                master
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

    <div class="BtnGroup float-right">
      <a href="/astaxie/build-web-application-with-golang/find/master"
            class="js-pjax-capture-input btn btn-sm BtnGroup-item"
            data-pjax
            data-hotkey="t">
        Find file
      </a>
      <clipboard-copy for="blob-path" class="btn btn-sm BtnGroup-item">
        Copy path
      </clipboard-copy>
    </div>
    <div id="blob-path" class="breadcrumb">
      <span class="repo-root js-repo-root"><span class="js-path-segment"><a data-pjax="true" href="/astaxie/build-web-application-with-golang"><span>build-web-application-with-golang</span></a></span></span><span class="separator">/</span><span class="js-path-segment"><a data-pjax="true" href="/astaxie/build-web-application-with-golang/tree/master/zh"><span>zh</span></a></span><span class="separator">/</span><strong class="final-path">08.1.md</strong>
    </div>
  </div>


  
  <div class="commit-tease">
      <span class="float-right">
        <a class="commit-tease-sha" href="/astaxie/build-web-application-with-golang/commit/b7240601353e0b6793b005b584503f163cd01013" data-pjax>
          b724060
        </a>
        <relative-time datetime="2017-12-12T11:22:53Z">Dec 12, 2017</relative-time>
      </span>
      <div>
        <a rel="contributor" data-skip-pjax="true" data-hovercard-user-id="19483698" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/invzhi"><img class="avatar" src="https://avatars2.githubusercontent.com/u/19483698?s=40&amp;v=4" width="20" height="20" alt="@invzhi" /></a>
        <a class="user-mention" rel="contributor" data-hovercard-user-id="19483698" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/invzhi">invzhi</a>
          <a data-pjax="true" title="Update code" class="message" href="/astaxie/build-web-application-with-golang/commit/b7240601353e0b6793b005b584503f163cd01013">Update code</a>
      </div>

    <div class="commit-tease-contributors">
      
<details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark float-left mr-2" id="blob_contributors_box">
  <summary class="btn-link" aria-haspopup="dialog"  >
    
    <span><strong>6</strong> contributors</span>
  </summary>
  <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast " aria-label="Users who have contributed to this file">
    <div class="Box-header">
      <button class="Box-btn-octicon btn-octicon float-right" type="button" aria-label="Close dialog" data-close-dialog>
        <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
      </button>
      <h3 class="Box-title">Users who have contributed to this file</h3>
    </div>
    
        <ul class="list-style-none overflow-auto">
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/vcaesar">
                <img class="avatar mr-2" alt="" src="https://avatars3.githubusercontent.com/u/16043470?s=40&amp;v=4" width="20" height="20" />
                vcaesar
</a>            </li>
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/invzhi">
                <img class="avatar mr-2" alt="" src="https://avatars2.githubusercontent.com/u/19483698?s=40&amp;v=4" width="20" height="20" />
                invzhi
</a>            </li>
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/Akagi201">
                <img class="avatar mr-2" alt="" src="https://avatars1.githubusercontent.com/u/1207959?s=40&amp;v=4" width="20" height="20" />
                Akagi201
</a>            </li>
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/astaxie">
                <img class="avatar mr-2" alt="" src="https://avatars3.githubusercontent.com/u/233907?s=40&amp;v=4" width="20" height="20" />
                astaxie
</a>            </li>
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/sydnash">
                <img class="avatar mr-2" alt="" src="https://avatars0.githubusercontent.com/u/5484932?s=40&amp;v=4" width="20" height="20" />
                sydnash
</a>            </li>
            <li class="Box-row">
              <a class="link-gray-dark no-underline" href="/lixuancn">
                <img class="avatar mr-2" alt="" src="https://avatars2.githubusercontent.com/u/6368760?s=40&amp;v=4" width="20" height="20" />
                lixuancn
</a>            </li>
        </ul>

  </details-dialog>
</details>
          <a class="avatar-link" data-hovercard-user-id="16043470" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/astaxie/build-web-application-with-golang/commits/master/zh/08.1.md?author=vcaesar">
      <img class="avatar" src="https://avatars3.githubusercontent.com/u/16043470?s=40&amp;v=4" width="20" height="20" alt="@vcaesar" /> 
</a>    <a class="avatar-link" data-hovercard-user-id="19483698" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/astaxie/build-web-application-with-golang/commits/master/zh/08.1.md?author=invzhi">
      <img class="avatar" src="https://avatars2.githubusercontent.com/u/19483698?s=40&amp;v=4" width="20" height="20" alt="@invzhi" /> 
</a>    <a class="avatar-link" data-hovercard-user-id="1207959" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/astaxie/build-web-application-with-golang/commits/master/zh/08.1.md?author=Akagi201">
      <img class="avatar" src="https://avatars1.githubusercontent.com/u/1207959?s=40&amp;v=4" width="20" height="20" alt="@Akagi201" /> 
</a>    <a class="avatar-link" data-hovercard-user-id="233907" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/astaxie/build-web-application-with-golang/commits/master/zh/08.1.md?author=astaxie">
      <img class="avatar" src="https://avatars3.githubusercontent.com/u/233907?s=40&amp;v=4" width="20" height="20" alt="@astaxie" /> 
</a>    <a class="avatar-link" data-hovercard-user-id="5484932" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/astaxie/build-web-application-with-golang/commits/master/zh/08.1.md?author=sydnash">
      <img class="avatar" src="https://avatars0.githubusercontent.com/u/5484932?s=40&amp;v=4" width="20" height="20" alt="@sydnash" /> 
</a>    <a class="avatar-link" data-hovercard-user-id="6368760" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="/astaxie/build-web-application-with-golang/commits/master/zh/08.1.md?author=lixuancn">
      <img class="avatar" src="https://avatars2.githubusercontent.com/u/6368760?s=40&amp;v=4" width="20" height="20" alt="@lixuancn" /> 
</a>

    </div>
  </div>



  <div class="file">
    <div class="file-header">
  <div class="file-actions">

    <div class="BtnGroup">
      <a id="raw-url" class="btn btn-sm BtnGroup-item" href="/astaxie/build-web-application-with-golang/raw/master/zh/08.1.md">Raw</a>
        <a class="btn btn-sm js-update-url-with-hash BtnGroup-item" data-hotkey="b" href="/astaxie/build-web-application-with-golang/blame/master/zh/08.1.md">Blame</a>
      <a rel="nofollow" class="btn btn-sm BtnGroup-item" href="/astaxie/build-web-application-with-golang/commits/master/zh/08.1.md">History</a>
    </div>


        <button type="button" class="btn-octicon disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <svg class="octicon octicon-pencil" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg>
        </button>
        <button type="button" class="btn-octicon btn-octicon-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <svg class="octicon octicon-trashcan" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg>
        </button>
  </div>

  <div class="file-info">
      436 lines (354 sloc)
      <span class="file-info-divider"></span>
    17.1 KB
  </div>
</div>

    
  <div id="readme" class="readme blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="text"><h1><a id="user-content-81-socket编程" class="anchor" aria-hidden="true" href="#81-socket编程"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>8.1 Socket编程</h1>
<p>在很多底层网络应用开发者的眼里一切编程都是Socket，话虽然有点夸张，但却也几乎如此了，现在的网络编程几乎都是用Socket来编程。你想过这些情景么？我们每天打开浏览器浏览网页时，浏览器进程怎么和Web服务器进行通信的呢？当你用QQ聊天时，QQ进程怎么和服务器或者是你的好友所在的QQ进程进行通信的呢？当你打开PPstream观看视频时，PPstream进程如何与视频服务器进行通信的呢？ 如此种种，都是靠Socket来进行通信的，以一斑窥全豹，可见Socket编程在现代编程中占据了多么重要的地位，这一节我们将介绍Go语言中如何进行Socket编程。</p>
<h2><a id="user-content-什么是socket" class="anchor" aria-hidden="true" href="#什么是socket"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>什么是Socket？</h2>
<p>Socket起源于Unix，而Unix基本哲学之一就是“一切皆文件”，都可以用“打开open –&gt; 读写write/read –&gt; 关闭close”模式来操作。Socket就是该模式的一个实现，网络的Socket数据传输是一种特殊的I/O，Socket也是一种文件描述符。Socket也具有一个类似于打开文件的函数调用：Socket()，该函数返回一个整型的Socket描述符，随后的连接建立、数据传输等操作都是通过该Socket实现的。</p>
<p>常用的Socket类型有两种：流式Socket（SOCK_STREAM）和数据报式Socket（SOCK_DGRAM）。流式是一种面向连接的Socket，针对于面向连接的TCP服务应用；数据报式Socket是一种无连接的Socket，对应于无连接的UDP服务应用。</p>
<h2><a id="user-content-socket如何通信" class="anchor" aria-hidden="true" href="#socket如何通信"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Socket如何通信</h2>
<p>网络中的进程之间如何通过Socket通信呢？首要解决的问题是如何唯一标识一个进程，否则通信无从谈起！在本地可以通过进程PID来唯一标识一个进程，但是在网络中这是行不通的。其实TCP/IP协议族已经帮我们解决了这个问题，网络层的“ip地址”可以唯一标识网络中的主机，而传输层的“协议+端口”可以唯一标识主机中的应用程序（进程）。这样利用三元组（ip地址，协议，端口）就可以标识网络的进程了，网络中需要互相通信的进程，就可以利用这个标志在他们之间进行交互。请看下面这个TCP/IP协议结构图</p>
<p><a target="_blank" rel="noopener noreferrer" href="/astaxie/build-web-application-with-golang/blob/master/zh/images/8.1.socket.png?raw=true"><img src="/astaxie/build-web-application-with-golang/raw/master/zh/images/8.1.socket.png?raw=true" alt="" style="max-width:100%;"></a></p>
<p>图8.1 七层网络协议图</p>
<p>使用TCP/IP协议的应用程序通常采用应用编程接口：UNIX BSD的套接字（socket）和UNIX System V的TLI（已经被淘汰），来实现网络进程之间的通信。就目前而言，几乎所有的应用程序都是采用socket，而现在又是网络时代，网络中进程通信是无处不在，这就是为什么说“一切皆Socket”。</p>
<h2><a id="user-content-socket基础知识" class="anchor" aria-hidden="true" href="#socket基础知识"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Socket基础知识</h2>
<p>通过上面的介绍我们知道Socket有两种：TCP Socket和UDP Socket，TCP和UDP是协议，而要确定一个进程的需要三元组，需要IP地址和端口。</p>
<h3><a id="user-content-ipv4地址" class="anchor" aria-hidden="true" href="#ipv4地址"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>IPv4地址</h3>
<p>目前的全球因特网所采用的协议族是TCP/IP协议。IP是TCP/IP协议中网络层的协议，是TCP/IP协议族的核心协议。目前主要采用的IP协议的版本号是4(简称为IPv4)，发展至今已经使用了30多年。</p>
<p>IPv4的地址位数为32位，也就是最多有2的32次方的网络设备可以联到Internet上。近十年来由于互联网的蓬勃发展，IP位址的需求量愈来愈大，使得IP位址的发放愈趋紧张，前一段时间，据报道IPV4的地址已经发放完毕，我们公司目前很多服务器的IP都是一个宝贵的资源。</p>
<p>地址格式类似这样：127.0.0.1 172.122.121.111</p>
<h3><a id="user-content-ipv6地址" class="anchor" aria-hidden="true" href="#ipv6地址"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>IPv6地址</h3>
<p>IPv6是下一版本的互联网协议，也可以说是下一代互联网的协议，它是为了解决IPv4在实施过程中遇到的各种问题而被提出的，IPv6采用128位地址长度，几乎可以不受限制地提供地址。按保守方法估算IPv6实际可分配的地址，整个地球的每平方米面积上仍可分配1000多个地址。在IPv6的设计过程中除了一劳永逸地解决了地址短缺问题以外，还考虑了在IPv4中解决不好的其它问题，主要有端到端IP连接、服务质量（QoS）、安全性、多播、移动性、即插即用等。</p>
<p>地址格式类似这样：2002:c0e8:82e7:0:0:0:c0e8:82e7</p>
<h3><a id="user-content-go支持的ip类型" class="anchor" aria-hidden="true" href="#go支持的ip类型"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Go支持的IP类型</h3>
<p>在Go的<code>net</code>包中定义了很多类型、函数和方法用来网络编程，其中IP的定义如下：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">type</span> <span class="pl-v">IP</span> []<span class="pl-k">byte</span>
</pre></div>
<p>在<code>net</code>包中有很多函数来操作IP，但是其中比较有用的也就几个，其中<code>ParseIP(s string) IP</code>函数会把一个IPv4或者IPv6的地址转化成IP类型，请看下面的例子:</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">package</span> main
<span class="pl-k">import</span> (
	<span class="pl-s"><span class="pl-pds">"</span>net<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>os<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>fmt<span class="pl-pds">"</span></span>
)
<span class="pl-k">func</span> <span class="pl-en">main</span>() {
	<span class="pl-k">if</span> <span class="pl-c1">len</span>(os.<span class="pl-smi">Args</span>) != <span class="pl-c1">2</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Usage: <span class="pl-c1">%s</span> ip-addr<span class="pl-cce">\n</span><span class="pl-pds">"</span></span>, os.<span class="pl-smi">Args</span>[<span class="pl-c1">0</span>])
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
	<span class="pl-smi">name</span> <span class="pl-k">:=</span> os.<span class="pl-smi">Args</span>[<span class="pl-c1">1</span>]
	<span class="pl-smi">addr</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ParseIP</span>(name)
	<span class="pl-k">if</span> addr == <span class="pl-c1">nil</span> {
		fmt.<span class="pl-c1">Println</span>(<span class="pl-s"><span class="pl-pds">"</span>Invalid address<span class="pl-pds">"</span></span>)
	} <span class="pl-k">else</span> {
		fmt.<span class="pl-c1">Println</span>(<span class="pl-s"><span class="pl-pds">"</span>The address is <span class="pl-pds">"</span></span>, addr.<span class="pl-c1">String</span>())
	}
	os.<span class="pl-c1">Exit</span>(<span class="pl-c1">0</span>)
}
</pre></div>
<p>执行之后你就会发现只要你输入一个IP地址就会给出相应的IP格式</p>
<h2><a id="user-content-tcp-socket" class="anchor" aria-hidden="true" href="#tcp-socket"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>TCP Socket</h2>
<p>当我们知道如何通过网络端口访问一个服务时，那么我们能够做什么呢？作为客户端来说，我们可以通过向远端某台机器的的某个网络端口发送一个请求，然后得到在机器的此端口上监听的服务反馈的信息。作为服务端，我们需要把服务绑定到某个指定端口，并且在此端口上监听，当有客户端来访问时能够读取信息并且写入反馈信息。</p>
<p>在Go语言的<code>net</code>包中有一个类型<code>TCPConn</code>，这个类型可以用来作为客户端和服务器端交互的通道，他有两个主要的函数：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">(<span class="pl-v">c</span> *<span class="pl-v">TCPConn</span>) <span class="pl-en">Write</span></span>(<span class="pl-v">b</span> []<span class="pl-v">byte</span>) (<span class="pl-v">int</span>, <span class="pl-v">error</span>)
func (c *TCPConn) Read(b []byte) (int, error)</pre></div>
<p><code>TCPConn</code>可以用在客户端和服务器端来读写数据。</p>
<p>还有我们需要知道一个<code>TCPAddr</code>类型，他表示一个TCP的地址信息，他的定义如下：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">type</span> <span class="pl-v">TCPAddr</span> <span class="pl-k">struct</span> {
	<span class="pl-v">IP</span> <span class="pl-v">IP</span>
	<span class="pl-v">Port</span> <span class="pl-k">int</span>
	<span class="pl-v">Zone</span> <span class="pl-k">string</span> <span class="pl-c"><span class="pl-c">//</span> IPv6 scoped addressing zone</span>
}</pre></div>
<p>在Go语言中通过<code>ResolveTCPAddr</code>获取一个<code>TCPAddr</code></p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">ResolveTCPAddr</span>(<span class="pl-v">net</span>, <span class="pl-v">addr</span> <span class="pl-v">string</span>) (*<span class="pl-v">TCPAddr</span>, <span class="pl-v">os</span>.<span class="pl-v">Error</span>)</pre></div>
<ul>
<li>net参数是"tcp4"、"tcp6"、"tcp"中的任意一个，分别表示TCP(IPv4-only), TCP(IPv6-only)或者TCP(IPv4, IPv6的任意一个)。</li>
<li>addr表示域名或者IP地址，例如"<a href="http://www.google.com:80" rel="nofollow">www.google.com:80</a>" 或者"127.0.0.1:22"。</li>
</ul>
<h3><a id="user-content-tcp-client" class="anchor" aria-hidden="true" href="#tcp-client"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>TCP client</h3>
<p>Go语言中通过net包中的<code>DialTCP</code>函数来建立一个TCP连接，并返回一个<code>TCPConn</code>类型的对象，当连接建立时服务器端也创建一个同类型的对象，此时客户端和服务器段通过各自拥有的<code>TCPConn</code>对象来进行数据交换。一般而言，客户端通过<code>TCPConn</code>对象将请求信息发送到服务器端，读取服务器端响应的信息。服务器端读取并解析来自客户端的请求，并返回应答信息，这个连接只有当任一端关闭了连接之后才失效，不然这连接可以一直在使用。建立连接的函数定义如下：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">DialTCP</span>(<span class="pl-v">network</span> <span class="pl-v">string</span>, <span class="pl-v">laddr</span>, <span class="pl-v">raddr</span> *<span class="pl-v">TCPAddr</span>) (*<span class="pl-v">TCPConn</span>, <span class="pl-v">error</span>)</pre></div>
<ul>
<li>net参数是"tcp4"、"tcp6"、"tcp"中的任意一个，分别表示TCP(IPv4-only)、TCP(IPv6-only)或者TCP(IPv4,IPv6的任意一个)</li>
<li>laddr表示本机地址，一般设置为nil</li>
<li>raddr表示远程的服务地址</li>
</ul>
<p>接下来我们写一个简单的例子，模拟一个基于HTTP协议的客户端请求去连接一个Web服务端。我们要写一个简单的http请求头，格式类似如下：</p>
<div class="highlight highlight-text-roff"><pre>"HEAD / HTTP/1.0<span class="pl-cce">\r</span><span class="pl-cce"><span class="pl-en">\n</span><span class="pl-v">\</span></span>r<span class="pl-cce"><span class="pl-en">\n</span><span class="pl-v">"</span></span></pre></div>
<p>从服务端接收到的响应信息格式可能如下：</p>
<div class="highlight highlight-source-go"><pre>HTTP/<span class="pl-c1">1.0</span> <span class="pl-c1">200</span> <span class="pl-v">OK</span>
ETag: <span class="pl-s"><span class="pl-pds">"</span>-9985996<span class="pl-pds">"</span></span>
Last-Modified: <span class="pl-v">Thu</span>, <span class="pl-c1">25</span> <span class="pl-v">Mar</span> <span class="pl-c1">2010</span> <span class="pl-c1">17</span>:<span class="pl-c1">51</span>:<span class="pl-c1">10</span> <span class="pl-v">GMT</span>
Content-Length: <span class="pl-c1">18074</span>
Connection: close
Date: <span class="pl-v">Sat</span>, <span class="pl-c1">28</span> <span class="pl-v">Aug</span> <span class="pl-c1">2010</span> <span class="pl-c1">00</span>:<span class="pl-c1">43</span>:<span class="pl-c1">48</span> <span class="pl-v">GMT</span>
Server: lighttpd/<span class="pl-c1">1.4.23</span></pre></div>
<p>我们的客户端代码如下所示：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">package</span> main

<span class="pl-k">import</span> (
	<span class="pl-s"><span class="pl-pds">"</span>fmt<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>io/ioutil<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>net<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>os<span class="pl-pds">"</span></span>
)

<span class="pl-k">func</span> <span class="pl-en">main</span>() {
	<span class="pl-k">if</span> <span class="pl-c1">len</span>(os.<span class="pl-smi">Args</span>) != <span class="pl-c1">2</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Usage: <span class="pl-c1">%s</span> host:port <span class="pl-pds">"</span></span>, os.<span class="pl-smi">Args</span>[<span class="pl-c1">0</span>])
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
	<span class="pl-smi">service</span> <span class="pl-k">:=</span> os.<span class="pl-smi">Args</span>[<span class="pl-c1">1</span>]
	<span class="pl-smi">tcpAddr</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ResolveTCPAddr</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp4<span class="pl-pds">"</span></span>, service)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-smi">conn</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">DialTCP</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp<span class="pl-pds">"</span></span>, <span class="pl-c1">nil</span>, tcpAddr)
	<span class="pl-c1">checkError</span>(err)
	_, err = conn.<span class="pl-c1">Write</span>([]<span class="pl-k">byte</span>(<span class="pl-s"><span class="pl-pds">"</span>HEAD / HTTP/1.0<span class="pl-cce">\r\n\r\n</span><span class="pl-pds">"</span></span>))
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-smi">result</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> ioutil.<span class="pl-c1">ReadAll</span>(conn)
	<span class="pl-c1">checkError</span>(err)
	fmt.<span class="pl-c1">Println</span>(<span class="pl-k">string</span>(result))
	os.<span class="pl-c1">Exit</span>(<span class="pl-c1">0</span>)
}
<span class="pl-k">func</span> <span class="pl-en">checkError</span>(<span class="pl-v">err</span> <span class="pl-v">error</span>) {
	<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Fatal error: <span class="pl-c1">%s</span><span class="pl-pds">"</span></span>, err.<span class="pl-c1">Error</span>())
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
}
</pre></div>
<p>通过上面的代码我们可以看出：首先程序将用户的输入作为参数<code>service</code>传入<code>net.ResolveTCPAddr</code>获取一个tcpAddr,然后把tcpAddr传入DialTCP后创建了一个TCP连接<code>conn</code>，通过<code>conn</code>来发送请求信息，最后通过<code>ioutil.ReadAll</code>从<code>conn</code>中读取全部的文本，也就是服务端响应反馈的信息。</p>
<h3><a id="user-content-tcp-server" class="anchor" aria-hidden="true" href="#tcp-server"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>TCP server</h3>
<p>上面我们编写了一个TCP的客户端程序，也可以通过net包来创建一个服务器端程序，在服务器端我们需要绑定服务到指定的非激活端口，并监听此端口，当有客户端请求到达的时候可以接收到来自客户端连接的请求。net包中有相应功能的函数，函数定义如下：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">ListenTCP</span>(<span class="pl-v">network</span> <span class="pl-v">string</span>, <span class="pl-v">laddr</span> *<span class="pl-v">TCPAddr</span>) (*<span class="pl-v">TCPListener</span>, <span class="pl-v">error</span>)
func (l *TCPListener) Accept() (Conn, error)</pre></div>
<p>参数说明同DialTCP的参数一样。下面我们实现一个简单的时间同步服务，监听7777端口</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">package</span> main

<span class="pl-k">import</span> (
	<span class="pl-s"><span class="pl-pds">"</span>fmt<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>net<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>os<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>time<span class="pl-pds">"</span></span>
)

<span class="pl-k">func</span> <span class="pl-en">main</span>() {
	<span class="pl-smi">service</span> <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">"</span>:7777<span class="pl-pds">"</span></span>
	<span class="pl-smi">tcpAddr</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ResolveTCPAddr</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp4<span class="pl-pds">"</span></span>, service)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-smi">listener</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ListenTCP</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp<span class="pl-pds">"</span></span>, tcpAddr)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-k">for</span> {
		<span class="pl-smi">conn</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> listener.<span class="pl-c1">Accept</span>()
		<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
			<span class="pl-k">continue</span>
		}
		<span class="pl-smi">daytime</span> <span class="pl-k">:=</span> time.<span class="pl-c1">Now</span>().<span class="pl-c1">String</span>()
		conn.<span class="pl-c1">Write</span>([]<span class="pl-k">byte</span>(daytime)) <span class="pl-c"><span class="pl-c">//</span> don't care about return value</span>
		conn.<span class="pl-c1">Close</span>()                <span class="pl-c"><span class="pl-c">//</span> we're finished with this client</span>
	}
}
<span class="pl-k">func</span> <span class="pl-en">checkError</span>(<span class="pl-v">err</span> <span class="pl-v">error</span>) {
	<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Fatal error: <span class="pl-c1">%s</span><span class="pl-pds">"</span></span>, err.<span class="pl-c1">Error</span>())
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
}
</pre></div>
<p>上面的服务跑起来之后，它将会一直在那里等待，直到有新的客户端请求到达。当有新的客户端请求到达并同意接受<code>Accept</code>该请求的时候他会反馈当前的时间信息。值得注意的是，在代码中<code>for</code>循环里，当有错误发生时，直接continue而不是退出，是因为在服务器端跑代码的时候，当有错误发生的情况下最好是由服务端记录错误，然后当前连接的客户端直接报错而退出，从而不会影响到当前服务端运行的整个服务。</p>
<p>上面的代码有个缺点，执行的时候是单任务的，不能同时接收多个请求，那么该如何改造以使它支持多并发呢？Go里面有一个goroutine机制，请看下面改造后的代码</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">package</span> main

<span class="pl-k">import</span> (
	<span class="pl-s"><span class="pl-pds">"</span>fmt<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>net<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>os<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>time<span class="pl-pds">"</span></span>
)

<span class="pl-k">func</span> <span class="pl-en">main</span>() {
	<span class="pl-smi">service</span> <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">"</span>:1200<span class="pl-pds">"</span></span>
	<span class="pl-smi">tcpAddr</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ResolveTCPAddr</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp4<span class="pl-pds">"</span></span>, service)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-smi">listener</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ListenTCP</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp<span class="pl-pds">"</span></span>, tcpAddr)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-k">for</span> {
		<span class="pl-smi">conn</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> listener.<span class="pl-c1">Accept</span>()
		<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
			<span class="pl-k">continue</span>
		}
		<span class="pl-k">go</span> <span class="pl-c1">handleClient</span>(conn)
	}
}

<span class="pl-k">func</span> <span class="pl-en">handleClient</span>(<span class="pl-v">conn</span> <span class="pl-v">net</span>.<span class="pl-v">Conn</span>) {
	<span class="pl-k">defer</span> conn.<span class="pl-c1">Close</span>()
	<span class="pl-smi">daytime</span> <span class="pl-k">:=</span> time.<span class="pl-c1">Now</span>().<span class="pl-c1">String</span>()
	conn.<span class="pl-c1">Write</span>([]<span class="pl-k">byte</span>(daytime)) <span class="pl-c"><span class="pl-c">//</span> don't care about return value</span>
	<span class="pl-c"><span class="pl-c">//</span> we're finished with this client</span>
}
<span class="pl-k">func</span> <span class="pl-en">checkError</span>(<span class="pl-v">err</span> <span class="pl-v">error</span>) {
	<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Fatal error: <span class="pl-c1">%s</span><span class="pl-pds">"</span></span>, err.<span class="pl-c1">Error</span>())
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
}
</pre></div>
<p>通过把业务处理分离到函数<code>handleClient</code>，我们就可以进一步地实现多并发执行了。看上去是不是很帅，增加<code>go</code>关键词就实现了服务端的多并发，从这个小例子也可以看出goroutine的强大之处。</p>
<p>有的朋友可能要问：这个服务端没有处理客户端实际请求的内容。如果我们需要通过从客户端发送不同的请求来获取不同的时间格式，而且需要一个长连接，该怎么做呢？请看：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">package</span> main

<span class="pl-k">import</span> (
	<span class="pl-s"><span class="pl-pds">"</span>fmt<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>net<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>os<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>time<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>strconv<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>strings<span class="pl-pds">"</span></span>
)

<span class="pl-k">func</span> <span class="pl-en">main</span>() {
	<span class="pl-smi">service</span> <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">"</span>:1200<span class="pl-pds">"</span></span>
	<span class="pl-smi">tcpAddr</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ResolveTCPAddr</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp4<span class="pl-pds">"</span></span>, service)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-smi">listener</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ListenTCP</span>(<span class="pl-s"><span class="pl-pds">"</span>tcp<span class="pl-pds">"</span></span>, tcpAddr)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-k">for</span> {
		<span class="pl-smi">conn</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> listener.<span class="pl-c1">Accept</span>()
		<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
			<span class="pl-k">continue</span>
		}
		<span class="pl-k">go</span> <span class="pl-c1">handleClient</span>(conn)
	}
}

<span class="pl-k">func</span> <span class="pl-en">handleClient</span>(<span class="pl-v">conn</span> <span class="pl-v">net</span>.<span class="pl-v">Conn</span>) {
	conn.<span class="pl-c1">SetReadDeadline</span>(time.<span class="pl-c1">Now</span>().<span class="pl-c1">Add</span>(<span class="pl-c1">2</span> * time.<span class="pl-smi">Minute</span>)) <span class="pl-c"><span class="pl-c">//</span> set 2 minutes timeout</span>
	<span class="pl-smi">request</span> <span class="pl-k">:=</span> <span class="pl-c1">make</span>([]<span class="pl-k">byte</span>, <span class="pl-c1">128</span>) <span class="pl-c"><span class="pl-c">//</span> set maxium request length to 128B to prevent flood attack</span>
	<span class="pl-k">defer</span> conn.<span class="pl-c1">Close</span>()  <span class="pl-c"><span class="pl-c">//</span> close connection before exit</span>
	<span class="pl-k">for</span> {
		<span class="pl-smi">read_len</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> conn.<span class="pl-c1">Read</span>(request)

		<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
			fmt.<span class="pl-c1">Println</span>(err)
			<span class="pl-k">break</span>
		}

    		<span class="pl-k">if</span> read_len == <span class="pl-c1">0</span> {
    			<span class="pl-k">break</span> <span class="pl-c"><span class="pl-c">//</span> connection already closed by client</span>
    		} <span class="pl-k">else</span> <span class="pl-k">if</span> strings.<span class="pl-c1">TrimSpace</span>(<span class="pl-k">string</span>(request[:read_len])) == <span class="pl-s"><span class="pl-pds">"</span>timestamp<span class="pl-pds">"</span></span> {
    			<span class="pl-smi">daytime</span> <span class="pl-k">:=</span> strconv.<span class="pl-c1">FormatInt</span>(time.<span class="pl-c1">Now</span>().<span class="pl-c1">Unix</span>(), <span class="pl-c1">10</span>)
    			conn.<span class="pl-c1">Write</span>([]<span class="pl-k">byte</span>(daytime))
    		} <span class="pl-k">else</span> {
    			<span class="pl-smi">daytime</span> <span class="pl-k">:=</span> time.<span class="pl-c1">Now</span>().<span class="pl-c1">String</span>()
    			conn.<span class="pl-c1">Write</span>([]<span class="pl-k">byte</span>(daytime))
    		}

    		request = <span class="pl-c1">make</span>([]<span class="pl-k">byte</span>, <span class="pl-c1">128</span>) <span class="pl-c"><span class="pl-c">//</span> clear last read content</span>
	}
}

<span class="pl-k">func</span> <span class="pl-en">checkError</span>(<span class="pl-v">err</span> <span class="pl-v">error</span>) {
	<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Fatal error: <span class="pl-c1">%s</span><span class="pl-pds">"</span></span>, err.<span class="pl-c1">Error</span>())
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
}
</pre></div>
<p>在上面这个例子中，我们使用<code>conn.Read()</code>不断读取客户端发来的请求。由于我们需要保持与客户端的长连接，所以不能在读取完一次请求后就关闭连接。由于<code>conn.SetReadDeadline()</code>设置了超时，当一定时间内客户端无请求发送，<code>conn</code>便会自动关闭，下面的for循环即会因为连接已关闭而跳出。需要注意的是，<code>request</code>在创建时需要指定一个最大长度以防止flood attack；每次读取到请求处理完毕后，需要清理request，因为<code>conn.Read()</code>会将新读取到的内容append到原内容之后。</p>
<h3><a id="user-content-控制tcp连接" class="anchor" aria-hidden="true" href="#控制tcp连接"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>控制TCP连接</h3>
<p>TCP有很多连接控制函数，我们平常用到比较多的有如下几个函数：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">DialTimeout</span>(<span class="pl-v">net</span>, <span class="pl-v">addr</span> <span class="pl-v">string</span>, <span class="pl-v">timeout</span> <span class="pl-v">time</span>.<span class="pl-v">Duration</span>) (<span class="pl-v">Conn</span>, <span class="pl-v">error</span>)
</pre></div>
<p>设置建立连接的超时时间，客户端和服务器端都适用，当超过设置时间时，连接自动关闭。</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">(<span class="pl-v">c</span> *<span class="pl-v">TCPConn</span>) <span class="pl-en">SetReadDeadline</span></span>(<span class="pl-v">t</span> <span class="pl-v">time</span>.<span class="pl-v">Time</span>) <span class="pl-v">error</span>
func (c *TCPConn) SetWriteDeadline(t time.Time) error
</pre></div>
<p>用来设置写入/读取一个连接的超时时间。当超过设置时间时，连接自动关闭。</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">(<span class="pl-v">c</span> *<span class="pl-v">TCPConn</span>) <span class="pl-en">SetKeepAlive</span></span>(<span class="pl-v">keepalive</span> <span class="pl-v">bool</span>) <span class="pl-v">os</span>.<span class="pl-v">Error</span></pre></div>
<p>设置keepAlive属性，是操作系统层在tcp上没有数据和ACK的时候，会间隔性的发送keepalive包，操作系统可以通过该包来判断一个tcp连接是否已经断开，在windows上默认2个小时没有收到数据和keepalive包的时候人为tcp连接已经断开，这个功能和我们通常在应用层加的心跳包的功能类似。</p>
<p>更多的内容请查看<code>net</code>包的文档。</p>
<h2><a id="user-content-udp-socket" class="anchor" aria-hidden="true" href="#udp-socket"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>UDP Socket</h2>
<p>Go语言包中处理UDP Socket和TCP Socket不同的地方就是在服务器端处理多个客户端请求数据包的方式不同,UDP缺少了对客户端连接请求的Accept函数。其他基本几乎一模一样，只有TCP换成了UDP而已。UDP的几个主要函数如下所示：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">func</span> <span class="pl-en">ResolveUDPAddr</span>(<span class="pl-v">net</span>, <span class="pl-v">addr</span> <span class="pl-v">string</span>) (*<span class="pl-v">UDPAddr</span>, <span class="pl-v">os</span>.<span class="pl-v">Error</span>)
func DialUDP(net string, laddr, raddr *UDPAddr) (c *UDPConn, err os.Error)
func ListenUDP(net string, laddr *UDPAddr) (c *UDPConn, err os.Error)
func (c *UDPConn) ReadFromUDP(b []byte) (n int, addr *UDPAddr, err os.Error)
func (c *UDPConn) WriteToUDP(b []byte, addr *UDPAddr) (n int, err os.Error)</pre></div>
<p>一个UDP的客户端代码如下所示,我们可以看到不同的就是TCP换成了UDP而已：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">package</span> main

<span class="pl-k">import</span> (
	<span class="pl-s"><span class="pl-pds">"</span>fmt<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>net<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>os<span class="pl-pds">"</span></span>
)

<span class="pl-k">func</span> <span class="pl-en">main</span>() {
	<span class="pl-k">if</span> <span class="pl-c1">len</span>(os.<span class="pl-smi">Args</span>) != <span class="pl-c1">2</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Usage: <span class="pl-c1">%s</span> host:port<span class="pl-pds">"</span></span>, os.<span class="pl-smi">Args</span>[<span class="pl-c1">0</span>])
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
	<span class="pl-smi">service</span> <span class="pl-k">:=</span> os.<span class="pl-smi">Args</span>[<span class="pl-c1">1</span>]
	<span class="pl-smi">udpAddr</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ResolveUDPAddr</span>(<span class="pl-s"><span class="pl-pds">"</span>udp4<span class="pl-pds">"</span></span>, service)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-smi">conn</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">DialUDP</span>(<span class="pl-s"><span class="pl-pds">"</span>udp<span class="pl-pds">"</span></span>, <span class="pl-c1">nil</span>, udpAddr)
	<span class="pl-c1">checkError</span>(err)
	_, err = conn.<span class="pl-c1">Write</span>([]<span class="pl-k">byte</span>(<span class="pl-s"><span class="pl-pds">"</span>anything<span class="pl-pds">"</span></span>))
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-k">var</span> <span class="pl-smi">buf</span> [<span class="pl-c1">512</span>]<span class="pl-k">byte</span>
	<span class="pl-smi">n</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> conn.<span class="pl-c1">Read</span>(buf[<span class="pl-c1">0</span>:])
	<span class="pl-c1">checkError</span>(err)
	fmt.<span class="pl-c1">Println</span>(<span class="pl-k">string</span>(buf[<span class="pl-c1">0</span>:n]))
	os.<span class="pl-c1">Exit</span>(<span class="pl-c1">0</span>)
}
<span class="pl-k">func</span> <span class="pl-en">checkError</span>(<span class="pl-v">err</span> <span class="pl-v">error</span>) {
	<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Fatal error <span class="pl-pds">"</span></span>, err.<span class="pl-c1">Error</span>())
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
}
</pre></div>
<p>我们来看一下UDP服务器端如何来处理：</p>
<div class="highlight highlight-source-go"><pre><span class="pl-k">package</span> main

<span class="pl-k">import</span> (
	<span class="pl-s"><span class="pl-pds">"</span>fmt<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>net<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>os<span class="pl-pds">"</span></span>
	<span class="pl-s"><span class="pl-pds">"</span>time<span class="pl-pds">"</span></span>
)

<span class="pl-k">func</span> <span class="pl-en">main</span>() {
	<span class="pl-smi">service</span> <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">"</span>:1200<span class="pl-pds">"</span></span>
	<span class="pl-smi">udpAddr</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ResolveUDPAddr</span>(<span class="pl-s"><span class="pl-pds">"</span>udp4<span class="pl-pds">"</span></span>, service)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-smi">conn</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> net.<span class="pl-c1">ListenUDP</span>(<span class="pl-s"><span class="pl-pds">"</span>udp<span class="pl-pds">"</span></span>, udpAddr)
	<span class="pl-c1">checkError</span>(err)
	<span class="pl-k">for</span> {
		<span class="pl-c1">handleClient</span>(conn)
	}
}
<span class="pl-k">func</span> <span class="pl-en">handleClient</span>(<span class="pl-v">conn</span> *<span class="pl-v">net</span>.<span class="pl-v">UDPConn</span>) {
	<span class="pl-k">var</span> <span class="pl-smi">buf</span> [<span class="pl-c1">512</span>]<span class="pl-k">byte</span>
	<span class="pl-smi">_</span>, <span class="pl-smi">addr</span>, <span class="pl-smi">err</span> <span class="pl-k">:=</span> conn.<span class="pl-c1">ReadFromUDP</span>(buf[<span class="pl-c1">0</span>:])
	<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
		<span class="pl-k">return</span>
	}
	<span class="pl-smi">daytime</span> <span class="pl-k">:=</span> time.<span class="pl-c1">Now</span>().<span class="pl-c1">String</span>()
	conn.<span class="pl-c1">WriteToUDP</span>([]<span class="pl-k">byte</span>(daytime), addr)
}
<span class="pl-k">func</span> <span class="pl-en">checkError</span>(<span class="pl-v">err</span> <span class="pl-v">error</span>) {
	<span class="pl-k">if</span> err != <span class="pl-c1">nil</span> {
		fmt.<span class="pl-c1">Fprintf</span>(os.<span class="pl-smi">Stderr</span>, <span class="pl-s"><span class="pl-pds">"</span>Fatal error <span class="pl-pds">"</span></span>, err.<span class="pl-c1">Error</span>())
		os.<span class="pl-c1">Exit</span>(<span class="pl-c1">1</span>)
	}
}
</pre></div>
<h2><a id="user-content-总结" class="anchor" aria-hidden="true" href="#总结"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>总结</h2>
<p>通过对TCP和UDP Socket编程的描述和实现，可见Go已经完备地支持了Socket编程，而且使用起来相当的方便，Go提供了很多函数，通过这些函数可以很容易就编写出高性能的Socket应用。</p>
<h2><a id="user-content-links" class="anchor" aria-hidden="true" href="#links"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>links</h2>
<ul>
<li><a href="/astaxie/build-web-application-with-golang/blob/master/zh/preface.md">目录</a></li>
<li>上一节: <a href="/astaxie/build-web-application-with-golang/blob/master/zh/08.0.md">Web服务</a></li>
<li>下一节: <a href="/astaxie/build-web-application-with-golang/blob/master/zh/08.2.md">WebSocket</a></li>
</ul>
</article>
  </div>

  </div>

  <details class="details-reset details-overlay details-overlay-dark">
    <summary data-hotkey="l" aria-label="Jump to line"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast linejump" aria-label="Jump to line">
      <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-jump-to-line-form Box-body d-flex" action="" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
        <input class="form-control flex-auto mr-3 linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
        <button type="submit" class="btn" data-close-dialog>Go</button>
</form>    </details-dialog>
  </details>


  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>

    </div>
  </div>

  </div>

        
<div class="footer container-lg px-3" role="contentinfo">
  <div class="position-relative d-flex flex-justify-between pt-6 pb-2 mt-6 f6 text-gray border-top border-gray-light ">
    <ul class="list-style-none d-flex flex-wrap ">
      <li class="mr-3">&copy; 2018 <span title="0.16792s from unicorn-77594b9c9-lcmfc">GitHub</span>, Inc.</li>
        <li class="mr-3"><a data-ga-click="Footer, go to terms, text:terms" href="https://github.com/site/terms">Terms</a></li>
        <li class="mr-3"><a data-ga-click="Footer, go to privacy, text:privacy" href="https://github.com/site/privacy">Privacy</a></li>
        <li class="mr-3"><a href="https://help.github.com/articles/github-security/" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li class="mr-3"><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a data-ga-click="Footer, go to help, text:help" href="https://help.github.com">Help</a></li>
    </ul>

    <a aria-label="Homepage" title="GitHub" class="footer-octicon mr-lg-4" href="https://github.com">
      <svg height="24" class="octicon octicon-mark-github" viewBox="0 0 16 16" version="1.1" width="24" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
   <ul class="list-style-none d-flex flex-wrap ">
        <li class="mr-3"><a data-ga-click="Footer, go to contact, text:contact" href="https://github.com/contact">Contact GitHub</a></li>
        <li class="mr-3"><a href="https://github.com/pricing" data-ga-click="Footer, go to Pricing, text:Pricing">Pricing</a></li>
      <li class="mr-3"><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li class="mr-3"><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
        <li class="mr-3"><a href="https://blog.github.com" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a data-ga-click="Footer, go to about, text:about" href="https://github.com/about">About</a></li>

    </ul>
  </div>
  <div class="d-flex flex-justify-center pb-6">
    <span class="f6 text-gray-light"></span>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <button type="button" class="flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
    </button>
    You can’t perform that action at this time.
  </div>


    <script crossorigin="anonymous" integrity="sha512-RJ1ufbxsSbKjRCyYvinsPNKvTBvcvvKUvEOJ8g+GjtWI5SuRr+QPBlZcvRDws4H9YwAgdQFcGxfL8UbwEfdI7A==" type="application/javascript" src="https://assets-cdn.github.com/assets/compat-daf14de28fadf1e2bc40d100cb773e2b.js"></script>
    <script crossorigin="anonymous" integrity="sha512-gB7wk1UK1eRelxt6Mw7cTmQMyE0gvGHeN8NqNpMjAN8Hmeb3GROvgqYWVvAro9tsEj+0e0HMkGbXe60gDNkNLw==" type="application/javascript" src="https://assets-cdn.github.com/assets/frameworks-bb6580f9e96dfbf21467d33218598f2c.js"></script>
    
    <script crossorigin="anonymous" async="async" integrity="sha512-qfUyw5LpNPTPv/9yViM2A7A4aveGNTGoub9QL3/+8d0v2MoqXYimROvZCbTrY5R71lHnENoE7c8m+G1OhLsG/Q==" type="application/javascript" src="https://assets-cdn.github.com/assets/github-5cb13afb52d05fe3d7a4f79a51a6b3c8.js"></script>
    
    
    
  <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner d-none">
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
    </button>
  </div>
</div>

  <template id="site-details-dialog">
  <details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark" open>
    <summary aria-haspopup="dialog" aria-label="Close dialog"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast">
      <button class="Box-btn-octicon m-0 btn-octicon position-absolute right-0 top-0" type="button" aria-label="Close dialog" data-close-dialog>
        <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
      </button>
      <div class="octocat-spinner my-6 js-details-dialog-spinner"></div>
    </details-dialog>
  </details>
</template>

  <div class="Popover js-hovercard-content position-absolute" style="display: none; outline: none;" tabindex="0">
  <div class="Popover-message Popover-message--bottom-left Popover-message--large Box box-shadow-large" style="width:360px;">
  </div>
</div>

<div id="hovercard-aria-description" class="sr-only">
  Press h to open a hovercard with more details.
</div>


  </body>
</html>

