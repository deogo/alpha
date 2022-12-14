


<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>DoDragDrop/IDataObject.ahk at master · AHK-just-me/DoDragDrop · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="AHK-just-me/DoDragDrop" name="twitter:title" /><meta content="Contribute to DoDragDrop development by creating an account on GitHub." name="twitter:description" /><meta content="https://avatars3.githubusercontent.com/u/2055724?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars3.githubusercontent.com/u/2055724?v=3&amp;s=400" property="og:image" /><meta content="AHK-just-me/DoDragDrop" property="og:title" /><meta content="https://github.com/AHK-just-me/DoDragDrop" property="og:url" /><meta content="Contribute to DoDragDrop development by creating an account on GitHub." property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="25913217:0F6B:1A35EA3F:561554C7" name="octolytics-dimension-request_id" />

<meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />


  <meta class="js-ga-set" name="dimension1" content="Logged Out">
    <meta class="js-ga-set" name="dimension4" content="Current repo nav">




    <meta name="is-dotcom" content="true">
        <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

      <!-- </textarea> --><!-- '"` --><meta content="authenticity_token" name="csrf-param" />
<meta content="ekjdVgubO55O/YxQ3hyJcVTpngRGWahYDjEuQr9u4DxIeu9SBkngluRSG9ZvLJuPCwezAGAjOux+oQw2a6qUjA==" name="csrf-token" />
    <meta content="7648e1d9d4774d311d1cc6f9c8180b70e2d4f906" name="form-nonce" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-923625b9d2e4b6f88c21f82fc71af24018eb1a9fbc8fc1151778e54d3c351454.css" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github2-9ad3aee49df1512bdaf35b062454a5d482df8542ac4ac78ba548d26d7806d58b.css" media="all" rel="stylesheet" />
    
    
    


    <meta http-equiv="x-pjax-version" content="28de8c211251d4aea24439065e894349">

      
  <meta name="description" content="Contribute to DoDragDrop development by creating an account on GitHub.">
  <meta name="go-import" content="github.com/AHK-just-me/DoDragDrop git https://github.com/AHK-just-me/DoDragDrop.git">

  <meta content="2055724" name="octolytics-dimension-user_id" /><meta content="AHK-just-me" name="octolytics-dimension-user_login" /><meta content="40230068" name="octolytics-dimension-repository_id" /><meta content="AHK-just-me/DoDragDrop" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="40230068" name="octolytics-dimension-repository_network_root_id" /><meta content="AHK-just-me/DoDragDrop" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/AHK-just-me/DoDragDrop/commits/master.atom" rel="alternate" title="Recent Commits to DoDragDrop:master" type="application/atom+xml">

  </head>


  <body class="logged_out   env-production windows vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



      
      <div class="header header-logged-out" role="banner">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions" role="navigation">
        <a class="btn btn-primary" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
      <a class="btn" href="/login?return_to=%2FAHK-just-me%2FDoDragDrop%2Fblob%2Fmaster%2Fsources%2FIDataObject.ahk" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
    </div>

    <div class="site-search repo-scope js-site-search" role="search">
      <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/AHK-just-me/DoDragDrop/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/AHK-just-me/DoDragDrop/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      aria-label="Search this repository"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
    </div>

      <ul class="header-nav left" role="navigation">
          <li class="header-nav-item">
            <a class="header-nav-link" href="/explore" data-ga-click="(Logged out) Header, go to explore, text:explore">Explore</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/features" data-ga-click="(Logged out) Header, go to features, text:features">Features</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://enterprise.github.com/" data-ga-click="(Logged out) Header, go to enterprise, text:enterprise">Enterprise</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/pricing" data-ga-click="(Logged out) Header, go to pricing, text:pricing">Pricing</a>
          </li>
      </ul>

  </div>
</div>



    <div id="start-of-content" class="accessibility-aid"></div>

    <div id="js-flash-container">
</div>


    <div role="main" class="main-content">
        <div itemscope itemtype="http://schema.org/WebPage">
    <div class="pagehead repohead instapaper_ignore readability-menu">

      <div class="container">

        <div class="clearfix">
          

<ul class="pagehead-actions">

  <li>
      <a href="/login?return_to=%2FAHK-just-me%2FDoDragDrop"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <span class="octicon octicon-eye"></span>
    Watch
  </a>
  <a class="social-count" href="/AHK-just-me/DoDragDrop/watchers">
    2
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2FAHK-just-me%2FDoDragDrop"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/AHK-just-me/DoDragDrop/stargazers">
      0
    </a>

  </li>

  <li>
      <a href="/login?return_to=%2FAHK-just-me%2FDoDragDrop"
        class="btn btn-sm btn-with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-repo-forked"></span>
        Fork
      </a>

    <a href="/AHK-just-me/DoDragDrop/network" class="social-count">
      0
    </a>
  </li>
</ul>

          <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public ">
  <span class="mega-octicon octicon-repo"></span>
  <span class="author"><a href="/AHK-just-me" class="url fn" itemprop="url" rel="author"><span itemprop="title">AHK-just-me</span></a></span><!--
--><span class="path-divider">/</span><!--
--><strong><a href="/AHK-just-me/DoDragDrop" data-pjax="#js-repo-pjax-container">DoDragDrop</a></strong>

  <span class="page-context-loader">
    <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
  </span>

</h1>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline ">
        <div class="repository-sidebar clearfix">
          
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/AHK-just-me/DoDragDrop/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/AHK-just-me/DoDragDrop" aria-label="Code" aria-selected="true" class="js-selected-navigation-item selected sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /AHK-just-me/DoDragDrop">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/AHK-just-me/DoDragDrop/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /AHK-just-me/DoDragDrop/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull requests">
      <a href="/AHK-just-me/DoDragDrop/pulls" aria-label="Pull requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /AHK-just-me/DoDragDrop/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/AHK-just-me/DoDragDrop/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /AHK-just-me/DoDragDrop/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/AHK-just-me/DoDragDrop/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /AHK-just-me/DoDragDrop/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


</nav>

            <div class="only-with-full-nav">
                
<div class="js-clone-url clone-url open"
  data-protocol-type="http">
  <h3 class="text-small"><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/AHK-just-me/DoDragDrop.git" readonly="readonly" aria-label="HTTPS clone URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="subversion">
  <h3 class="text-small"><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/AHK-just-me/DoDragDrop" readonly="readonly" aria-label="Subversion checkout URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<div class="clone-options text-small">You can clone with
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone" class="inline-form js-clone-selector-form " data-form-nonce="7648e1d9d4774d311d1cc6f9c8180b70e2d4f906" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="EEqb4umlx7kT2WntyPbAoUfWRMtljHqN0JaPHuF/JheapU9ZrxhkCML9Z99afUUqr/eFyCA2Dysbq5OK0vYztw==" /></div><button class="btn-link js-clone-selector" data-protocol="http" type="submit">HTTPS</button></form> or <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone" class="inline-form js-clone-selector-form " data-form-nonce="7648e1d9d4774d311d1cc6f9c8180b70e2d4f906" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="EGWq3hCSbS7HMcDpx8rngY2kVhgCv2klfmYBv2xG0VlRnQc/bZUPVTM+R7TGJ6gFMMkAcFqFe/0OcPIxUsPlNg==" /></div><button class="btn-link js-clone-selector" data-protocol="subversion" type="submit">Subversion</button></form>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</div>
  <a href="https://windows.github.com" class="btn btn-sm sidebar-button" title="Save AHK-just-me/DoDragDrop to your computer and use it in GitHub Desktop." aria-label="Save AHK-just-me/DoDragDrop to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-desktop-download"></span>
    Clone in Desktop
  </a>

              <a href="/AHK-just-me/DoDragDrop/archive/master.zip"
                 class="btn btn-sm sidebar-button"
                 aria-label="Download the contents of AHK-just-me/DoDragDrop as a zip file"
                 title="Download the contents of AHK-just-me/DoDragDrop as a zip file"
                 rel="nofollow">
                <span class="octicon octicon-cloud-download"></span>
                Download ZIP
              </a>
            </div>
        </div>
        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>

          

<a href="/AHK-just-me/DoDragDrop/blob/67075c3e2468135f3b413bbf2b7bce06f65d08e7/sources/IDataObject.ahk" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:f17094be49fd1ee6f4e7a43a61e30ec8 -->

  <div class="file-navigation js-zeroclipboard-container">
    
<div class="select-menu js-menu-container js-select-menu left">
  <span class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
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
               href="/AHK-just-me/DoDragDrop/blob/master/sources/IDataObject.ahk"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
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

    <div class="btn-group right">
      <a href="/AHK-just-me/DoDragDrop/find/master"
            class="js-show-file-finder btn btn-sm empty-icon tooltipped tooltipped-nw"
            data-pjax
            data-hotkey="t"
            aria-label="Quickly jump between files">
        <span class="octicon octicon-list-unordered"></span>
      </a>
      <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </div>

    <div class="breadcrumb js-zeroclipboard-target">
      <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/AHK-just-me/DoDragDrop" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">DoDragDrop</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/AHK-just-me/DoDragDrop/tree/master/sources" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">sources</span></a></span><span class="separator">/</span><strong class="final-path">IDataObject.ahk</strong>
    </div>
  </div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="@AHK-just-me" class="avatar" height="24" src="https://avatars0.githubusercontent.com/u/2055724?v=3&amp;s=48" width="24" />
        <span class="author"><a href="/AHK-just-me" rel="author">AHK-just-me</a></span>
        <time datetime="2015-08-14T06:13:56Z" is="relative-time">Aug 14, 2015</time>
        <div class="commit-title">
            <a href="/AHK-just-me/DoDragDrop/commit/85e526996954d0aec7f92bf71b598d3c125ebdfd" class="message" data-pjax="true" title="Update">Update</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>1</strong>
           contributor
        </a>
      </p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@AHK-just-me" height="24" src="https://avatars0.githubusercontent.com/u/2055724?v=3&amp;s=48" width="24" />
            <a href="/AHK-just-me">AHK-just-me</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/AHK-just-me/DoDragDrop/raw/master/sources/IDataObject.ahk" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/AHK-just-me/DoDragDrop/blame/master/sources/IDataObject.ahk" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/AHK-just-me/DoDragDrop/commits/master/sources/IDataObject.ahk" class="btn btn-sm " rel="nofollow">History</a>
    </div>

      <a class="octicon-btn tooltipped tooltipped-nw"
         href="https://windows.github.com"
         aria-label="Open this file in GitHub Desktop"
         data-ga-click="Repository, open with desktop, type:windows">
          <span class="octicon octicon-device-desktop"></span>
      </a>

        <button type="button" class="octicon-btn disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-pencil"></span>
        </button>
        <button type="button" class="octicon-btn octicon-btn-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-trashcan"></span>
        </button>
  </div>

  <div class="file-info">
      180 lines (180 sloc)
      <span class="file-info-divider"></span>
    9.89 KB
  </div>
</div>

  

  <div class="blob-wrapper data type-autohotkey">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; IDataObject interface -&gt; msdn.microsoft.com/en-us/library/ms688421(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; Partial implementation.</span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; Requires: IEnumFORMATETC.ahk</span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_EnumFormatEtc</span>(<span class="pl-s">pDataObj</span>) {</td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; EnumFormatEtc -&gt; msdn.microsoft.com/en-us/library/ms683979(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; DATADIR_GET = 1</span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> EnumFormatEtc <span class="pl-k">:=</span> <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> <span class="pl-c1">8</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">   pVTBL <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(pDataObj <span class="pl-k">+</span> <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> <span class="pl-k">!</span><span class="pl-c1">DllCall</span>(<span class="pl-c1">NumGet</span>(pVTBL <span class="pl-k">+</span> EnumFormatEtc, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>), <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, pDataObj, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">1</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>PtrP<span class="pl-pds">&quot;</span></span>, ppenumFormatEtc, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">Return</span> ppenumFormatEtc</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-c1">False</span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_GetData</span>(<span class="pl-s">pDataObj, ByRef FORMATETC, ByRef Size, ByRef Data</span>) {</td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; GetData -&gt; msdn.microsoft.com/en-us/library/ms678431(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> GetData <span class="pl-k">:=</span> <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> <span class="pl-c1">3</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line">   Data <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line">   , Size <span class="pl-k">:=</span> <span class="pl-k">-</span><span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">VarSetCapacity</span>(STGMEDIUM, <span class="pl-c1">24</span>, <span class="pl-c1">0</span>) <span class="pl-c">; 64-bit</span></td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line">   , pVTBL <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(pDataObj <span class="pl-k">+</span> <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> <span class="pl-k">!</span><span class="pl-c1">DllCall</span>(<span class="pl-c1">NumGet</span>(pVTBL <span class="pl-k">+</span> GetData, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>), <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, pDataObj, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>FORMATETC, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>STGMEDIUM, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>) {</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">If</span> (<span class="pl-c1">NumGet</span>(STGMEDIUM, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) <span class="pl-k">=</span> <span class="pl-c1">1</span>) { <span class="pl-c">; TYMED_HGLOBAL</span></td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line">         hGlobal <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(STGMEDIUM, <span class="pl-c1">A_PtrSize</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">         , pGlobal <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalLock<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, hGlobal, <span class="pl-s"><span class="pl-pds">&quot;</span>Uptr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line">         , Size <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalSize<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, hGlobal, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line">         , <span class="pl-c1">VarSetCapacity</span>(Data, Size, <span class="pl-c1">0</span>)</td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line">         , <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>RtlMoveMemory<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>Data, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, pGlobal, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, Size)</td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line">         , <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalUnlock<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, hGlobal)</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line">         , <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Ole32.dll\ReleaseStgMedium<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>STGMEDIUM)</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">Return</span> <span class="pl-c1">True</span></td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">      }</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Ole32.dll\ReleaseStgMedium<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>STGMEDIUM)</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">   }</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-c1">False</span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_QueryGetData</span>(<span class="pl-s">pDataObj, ByRef FORMATETC</span>) {</td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; QueryGetData -&gt; msdn.microsoft.com/en-us/library/ms680637(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> QueryGetData <span class="pl-k">:=</span> <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> <span class="pl-c1">5</span></td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">   pVTBL <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(pDataObj <span class="pl-k">+</span> <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-k">!</span><span class="pl-c1">DllCall</span>(<span class="pl-c1">NumGet</span>(pVTBL <span class="pl-k">+</span> QueryGetData, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>), <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, pDataObj, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>FORMATETC, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_SetData</span>(<span class="pl-s">pDataObj, ByRef FORMATETC, ByRef STGMEDIUM</span>) {</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; SetData -&gt; msdn.microsoft.com/en-us/library/ms686626(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> SetData <span class="pl-k">:=</span> <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> <span class="pl-c1">7</span></td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">   pVTBL <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(pDataObj <span class="pl-k">+</span> <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-k">!</span><span class="pl-c1">DllCall</span>(<span class="pl-c1">NumGet</span>(pVTBL <span class="pl-k">+</span> SetData, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>), <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, pDataObj, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>FORMATETC, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>STGMEDIUM, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">True</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; Auxiliary functions to get/set data of the data object.</span></td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; FORMATETC structure -&gt; msdn.microsoft.com/en-us/library/ms682242(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_CreateFormatEtc</span>(<span class="pl-s">ByRef FORMATETC, Format, Aspect := 1, Index := -1, Tymed := 1</span>) {</td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; DVASPECT_CONTENT = 1, Index all data = -1, TYMED_HGLOBAL = 1</span></td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">   <span class="pl-c1">VarSetCapacity</span>(FORMATETC, <span class="pl-c1">32</span>, <span class="pl-c1">0</span>) <span class="pl-c">; 64-bit</span></td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(Format, FORMATETC, <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ushort<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(Aspect, FORMATETC, <span class="pl-c1">A_PtrSize</span> <span class="pl-k">=</span> <span class="pl-c1">8</span> ? <span class="pl-c1">16</span> : <span class="pl-c1">8</span> , <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(Index, FORMATETC, <span class="pl-c1">A_PtrSIze</span> <span class="pl-k">=</span> <span class="pl-c1">8</span> ? <span class="pl-c1">20</span> : <span class="pl-c1">12</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(Tymed, FORMATETC, <span class="pl-c1">A_PtrSize</span> <span class="pl-k">=</span> <span class="pl-c1">8</span> ? <span class="pl-c1">24</span> : <span class="pl-c1">16</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-k">&amp;</span>FORMATETC</td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_ReadFormatEtc</span>(<span class="pl-s">ByRef FORMATETC, ByRef Format, ByRef Device, ByRef Aspect, ByRef Index, ByRef Tymed</span>) {</td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">   Format <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(FORMATETC, OffSet <span class="pl-k">:=</span> <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UShort<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line">   , Device <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(FORMATETC, Offset <span class="pl-k">+</span><span class="pl-k">=</span> <span class="pl-c1">A_PtrSize</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line">   , Aspect <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(FORMATETC, Offset <span class="pl-k">+</span><span class="pl-k">=</span> <span class="pl-c1">A_PtrSize</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line">   , Index  <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(FORMATETC, Offset <span class="pl-k">+</span><span class="pl-k">=</span> <span class="pl-c1">4</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">   , Tymed  <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(FORMATETC, Offset <span class="pl-k">+</span><span class="pl-k">=</span> <span class="pl-c1">4</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; Get/Set format data.</span></td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_GetDroppedFiles</span>(<span class="pl-s">pDataObj, ByRef DroppedFiles</span>) {</td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; msdn.microsoft.com/en-us/library/bb773269(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line">   IDataObject_CreateFormatEtc(FORMATETC, <span class="pl-c1">15</span>) <span class="pl-c">; CF_HDROP</span></td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line">   DroppedFiles <span class="pl-k">:=</span> []</td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> IDataObject_GetData(pDataObj, FORMATETC, Size, Data) {</td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line">      Offset <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(Data, <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line">      CP <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(Data, <span class="pl-c1">16</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) ? <span class="pl-s"><span class="pl-pds">&quot;</span>UTF-16<span class="pl-pds">&quot;</span></span> : <span class="pl-s"><span class="pl-pds">&quot;</span>CP0<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">Shift</span> <span class="pl-k">:=</span> (CP <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>UTF-16<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">While</span> (File <span class="pl-k">:=</span> <span class="pl-c1">StrGet</span>(<span class="pl-k">&amp;</span>Data <span class="pl-k">+</span> Offset, CP)) {</td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">         DroppedFiles.Push(File)</td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">         Offset <span class="pl-k">+</span><span class="pl-k">=</span> (<span class="pl-c1">StrLen</span>(File) <span class="pl-k">+</span> <span class="pl-c1">1</span>) <span class="pl-k">&lt;&lt;</span> <span class="pl-k">Shift</span></td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">      }</td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">   }</td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> DroppedFiles.Length()</td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_GetLogicalDropEffect</span>(<span class="pl-s">pDataObj, ByRef DropEffect</span>) {</td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> LogicalDropEffect <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>RegisterClipboardFormat<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Str<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Logical Performed DropEffect<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">   IDataObject_CreateFormatEtc(FORMATETC, LogicalDropEffect)</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">   DropEffect <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> IDataObject_GetData(pDataObj, FORMATETC, Size, Data) {</td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">      DropEffect <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(Data, <span class="pl-s"><span class="pl-pds">&quot;</span>UChar<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">Return</span> <span class="pl-c1">True</span></td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line">   }</td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-c1">False</span></td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_GetPerformedDropEffect</span>(<span class="pl-s">pDataObj, ByRef DropEffect</span>) {</td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> PerformedDropEffect <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>RegisterClipboardFormat<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Str<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Performed DropEffect<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line">   IDataObject_CreateFormatEtc(FORMATETC, PerformedDropEffect)</td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line">   DropEffect <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> IDataObject_GetData(pDataObj, FORMATETC, Size, Data) {</td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line">      DropEffect <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(Data, <span class="pl-s"><span class="pl-pds">&quot;</span>UChar<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">Return</span> <span class="pl-c1">True</span></td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line">   }</td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-c1">False</span></td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_GetText</span>(<span class="pl-s">pDataObj, ByRef Txt</span>) {</td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_NATIVE <span class="pl-k">:=</span> <span class="pl-c1">A_IsUnicode</span> ? <span class="pl-c1">13</span> : <span class="pl-c1">1</span> <span class="pl-c">; CF_UNICODETEXT : CF_TEXT</span></td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line">   IDataObject_CreateFormatEtc(FORMATETC, CF_NATIVE)</td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line">   Txt <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> IDataObject_GetData(pDataObj, FORMATETC, Size, Data) {</td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line">      Txt <span class="pl-k">:=</span> <span class="pl-c1">StrGet</span>(Data, Size <span class="pl-k">&gt;&gt;</span> <span class="pl-k">!!</span><span class="pl-c1">A_IsUnicode</span>)</td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">Return</span> <span class="pl-c1">True</span></td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line">   }</td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> <span class="pl-c1">False</span></td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_SetLogicalDropEffect</span>(<span class="pl-s">pDataObj, DropEffect</span>) {</td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> LogicalDropEffect <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>RegisterClipboardFormat<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Str<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Logical Performed DropEffect<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code blob-code-inner js-file-line">   IDataObject_CreateFormatEtc(FORMATETC, LogicalDropEffect)</td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">VarSetCapacity</span>(STGMEDIUM, <span class="pl-c1">24</span>, <span class="pl-c1">0</span>) <span class="pl-c">; 64-bit</span></td>
      </tr>
      <tr>
        <td id="L130" class="blob-num js-line-number" data-line-number="130"></td>
        <td id="LC130" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(<span class="pl-c1">1</span>, STGMEDIUM, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) <span class="pl-c">; TYMED_HGLOBAL</span></td>
      </tr>
      <tr>
        <td id="L131" class="blob-num js-line-number" data-line-number="131"></td>
        <td id="LC131" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; 0x42 = GMEM_MOVEABLE (0x02) | GMEM_ZEROINIT (0x40)</span></td>
      </tr>
      <tr>
        <td id="L132" class="blob-num js-line-number" data-line-number="132"></td>
        <td id="LC132" class="blob-code blob-code-inner js-file-line">   , hMem <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalAlloc<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">0x42</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">4</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L133" class="blob-num js-line-number" data-line-number="133"></td>
        <td id="LC133" class="blob-code blob-code-inner js-file-line">   , pMem <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalLock<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, hMem)</td>
      </tr>
      <tr>
        <td id="L134" class="blob-num js-line-number" data-line-number="134"></td>
        <td id="LC134" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(DropEffect, pMem <span class="pl-k">+</span> <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UChar<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L135" class="blob-num js-line-number" data-line-number="135"></td>
        <td id="LC135" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalUnlock<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, hMem)</td>
      </tr>
      <tr>
        <td id="L136" class="blob-num js-line-number" data-line-number="136"></td>
        <td id="LC136" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(hMem, STGMEDIUM, <span class="pl-c1">A_PtrSize</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L137" class="blob-num js-line-number" data-line-number="137"></td>
        <td id="LC137" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> IDataObject_SetData(pDataObj, FORMATETC, STGMEDIUM)</td>
      </tr>
      <tr>
        <td id="L138" class="blob-num js-line-number" data-line-number="138"></td>
        <td id="LC138" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L139" class="blob-num js-line-number" data-line-number="139"></td>
        <td id="LC139" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L140" class="blob-num js-line-number" data-line-number="140"></td>
        <td id="LC140" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_SetPerformedDropEffect</span>(<span class="pl-s">pDataObj, DropEffect</span>) {</td>
      </tr>
      <tr>
        <td id="L141" class="blob-num js-line-number" data-line-number="141"></td>
        <td id="LC141" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> PerformedDropEffect <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>RegisterClipboardFormat<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Str<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Performed DropEffect<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L142" class="blob-num js-line-number" data-line-number="142"></td>
        <td id="LC142" class="blob-code blob-code-inner js-file-line">   IDataObject_CreateFormatEtc(FORMATETC, PerformedDropEffect)</td>
      </tr>
      <tr>
        <td id="L143" class="blob-num js-line-number" data-line-number="143"></td>
        <td id="LC143" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">VarSetCapacity</span>(STGMEDIUM, <span class="pl-c1">24</span>, <span class="pl-c1">0</span>) <span class="pl-c">; 64-bit</span></td>
      </tr>
      <tr>
        <td id="L144" class="blob-num js-line-number" data-line-number="144"></td>
        <td id="LC144" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(<span class="pl-c1">1</span>, STGMEDIUM, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) <span class="pl-c">; TYMED_HGLOBAL</span></td>
      </tr>
      <tr>
        <td id="L145" class="blob-num js-line-number" data-line-number="145"></td>
        <td id="LC145" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; 0x42 = GMEM_MOVEABLE (0x02) | GMEM_ZEROINIT (0x40)</span></td>
      </tr>
      <tr>
        <td id="L146" class="blob-num js-line-number" data-line-number="146"></td>
        <td id="LC146" class="blob-code blob-code-inner js-file-line">   , hMem <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalAlloc<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">0x42</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">4</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L147" class="blob-num js-line-number" data-line-number="147"></td>
        <td id="LC147" class="blob-code blob-code-inner js-file-line">   , pMem <span class="pl-k">:=</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalLock<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, hMem)</td>
      </tr>
      <tr>
        <td id="L148" class="blob-num js-line-number" data-line-number="148"></td>
        <td id="LC148" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(DropEffect, pMem <span class="pl-k">+</span> <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UChar<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L149" class="blob-num js-line-number" data-line-number="149"></td>
        <td id="LC149" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GlobalUnlock<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, hMem)</td>
      </tr>
      <tr>
        <td id="L150" class="blob-num js-line-number" data-line-number="150"></td>
        <td id="LC150" class="blob-code blob-code-inner js-file-line">   , <span class="pl-c1">NumPut</span>(hMem, STGMEDIUM, <span class="pl-c1">A_PtrSize</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L151" class="blob-num js-line-number" data-line-number="151"></td>
        <td id="LC151" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> IDataObject_SetData(pDataObj, FORMATETC, STGMEDIUM)</td>
      </tr>
      <tr>
        <td id="L152" class="blob-num js-line-number" data-line-number="152"></td>
        <td id="LC152" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L153" class="blob-num js-line-number" data-line-number="153"></td>
        <td id="LC153" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L154" class="blob-num js-line-number" data-line-number="154"></td>
        <td id="LC154" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDataObject_SHFileOperation</span>(<span class="pl-s">pDataObj, TargetPath, Operation, HWND := 0</span>) {</td>
      </tr>
      <tr>
        <td id="L155" class="blob-num js-line-number" data-line-number="155"></td>
        <td id="LC155" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; SHFileOperation -&gt; msdn.microsoft.com/en-us/library/bb762164(v=vs.85).aspx</span></td>
      </tr>
      <tr>
        <td id="L156" class="blob-num js-line-number" data-line-number="156"></td>
        <td id="LC156" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> Operation <span class="pl-k">Not</span> <span class="pl-k">In</span> <span class="pl-c1">1</span>,<span class="pl-c1">2</span></td>
      </tr>
      <tr>
        <td id="L157" class="blob-num js-line-number" data-line-number="157"></td>
        <td id="LC157" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">Return</span> <span class="pl-c1">False</span></td>
      </tr>
      <tr>
        <td id="L158" class="blob-num js-line-number" data-line-number="158"></td>
        <td id="LC158" class="blob-code blob-code-inner js-file-line">   IDataObject_CreateFormatEtc(FORMATETC, <span class="pl-c1">15</span>) <span class="pl-c">; CF_HDROP</span></td>
      </tr>
      <tr>
        <td id="L159" class="blob-num js-line-number" data-line-number="159"></td>
        <td id="LC159" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> IDataObject_GetData(pDataObj, FORMATETC, Size, Data) {</td>
      </tr>
      <tr>
        <td id="L160" class="blob-num js-line-number" data-line-number="160"></td>
        <td id="LC160" class="blob-code blob-code-inner js-file-line">      Offset <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(Data, <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) <span class="pl-c">; offset of the file list</span></td>
      </tr>
      <tr>
        <td id="L161" class="blob-num js-line-number" data-line-number="161"></td>
        <td id="LC161" class="blob-code blob-code-inner js-file-line">      IsUnicode <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(Data, <span class="pl-c1">16</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) <span class="pl-c">; 1: Unicode, 0: ANSI</span></td>
      </tr>
      <tr>
        <td id="L162" class="blob-num js-line-number" data-line-number="162"></td>
        <td id="LC162" class="blob-code blob-code-inner js-file-line">      TargetLen <span class="pl-k">:=</span> <span class="pl-c1">StrPut</span>(TargetPath, IsUnicode ? <span class="pl-s"><span class="pl-pds">&quot;</span>UTF-16<span class="pl-pds">&quot;</span></span> : <span class="pl-s"><span class="pl-pds">&quot;</span>CP0<span class="pl-pds">&quot;</span></span>) <span class="pl-k">+</span> <span class="pl-c1">2</span></td>
      </tr>
      <tr>
        <td id="L163" class="blob-num js-line-number" data-line-number="163"></td>
        <td id="LC163" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">VarSetCapacity</span>(Target, TargetLen <span class="pl-k">&lt;&lt;</span> <span class="pl-k">!!</span>IsUnicode, <span class="pl-c1">0</span>)</td>
      </tr>
      <tr>
        <td id="L164" class="blob-num js-line-number" data-line-number="164"></td>
        <td id="LC164" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">StrPut</span>(TargetPath, <span class="pl-k">&amp;</span>Target, IsUnicode ? <span class="pl-s"><span class="pl-pds">&quot;</span>UTF-16<span class="pl-pds">&quot;</span></span> : <span class="pl-s"><span class="pl-pds">&quot;</span>CP0<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L165" class="blob-num js-line-number" data-line-number="165"></td>
        <td id="LC165" class="blob-code blob-code-inner js-file-line">      SHFOSLen <span class="pl-k">:=</span> <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> (<span class="pl-c1">A_PtrSize</span> <span class="pl-k">=</span> <span class="pl-c1">8</span> ? <span class="pl-c1">7</span> : <span class="pl-c1">8</span>)</td>
      </tr>
      <tr>
        <td id="L166" class="blob-num js-line-number" data-line-number="166"></td>
        <td id="LC166" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">VarSetCapacity</span>(SHFOS, SHFOSLen, <span class="pl-c1">0</span>) <span class="pl-c">; SHFILEOPSTRUCT</span></td>
      </tr>
      <tr>
        <td id="L167" class="blob-num js-line-number" data-line-number="167"></td>
        <td id="LC167" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">NumPut</span>(HWND, SHFOS, <span class="pl-c1">0</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L168" class="blob-num js-line-number" data-line-number="168"></td>
        <td id="LC168" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">NumPut</span>(Operation, SHFOS, <span class="pl-c1">A_PtrSize</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) <span class="pl-c">; FO_MOVE = 1, FO_COPY = 2, so we have to swap the DropEffect</span></td>
      </tr>
      <tr>
        <td id="L169" class="blob-num js-line-number" data-line-number="169"></td>
        <td id="LC169" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">NumPut</span>(<span class="pl-k">&amp;</span>Data <span class="pl-k">+</span> Offset, SHFOS, <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> <span class="pl-c1">2</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L170" class="blob-num js-line-number" data-line-number="170"></td>
        <td id="LC170" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">NumPut</span>(<span class="pl-k">&amp;</span>Target, SHFOS, <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> <span class="pl-c1">3</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UPtr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L171" class="blob-num js-line-number" data-line-number="171"></td>
        <td id="LC171" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">NumPut</span>(<span class="pl-c1">0x0200</span>, SHFOS, <span class="pl-c1">A_PtrSize</span> <span class="pl-k">*</span> <span class="pl-c1">4</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>) <span class="pl-c">; FOF_NOCONFIRMMKDIR</span></td>
      </tr>
      <tr>
        <td id="L172" class="blob-num js-line-number" data-line-number="172"></td>
        <td id="LC172" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">If</span> (IsUnicode)</td>
      </tr>
      <tr>
        <td id="L173" class="blob-num js-line-number" data-line-number="173"></td>
        <td id="LC173" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">Return</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Shell32.dll\SHFileOperationW<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>SHFOS, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L174" class="blob-num js-line-number" data-line-number="174"></td>
        <td id="LC174" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">Else</span></td>
      </tr>
      <tr>
        <td id="L175" class="blob-num js-line-number" data-line-number="175"></td>
        <td id="LC175" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">Return</span> <span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Shell32.dll\SHFileOperationA<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>Ptr<span class="pl-pds">&quot;</span></span>, <span class="pl-k">&amp;</span>SHFOS, <span class="pl-s"><span class="pl-pds">&quot;</span>Int<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L176" class="blob-num js-line-number" data-line-number="176"></td>
        <td id="LC176" class="blob-code blob-code-inner js-file-line">   }</td>
      </tr>
      <tr>
        <td id="L177" class="blob-num js-line-number" data-line-number="177"></td>
        <td id="LC177" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L178" class="blob-num js-line-number" data-line-number="178"></td>
        <td id="LC178" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L179" class="blob-num js-line-number" data-line-number="179"></td>
        <td id="LC179" class="blob-code blob-code-inner js-file-line"><span class="pl-k">#Include<span class="pl-s"> *i %A_ScriptDir%\IEnumFORMATETC.ahk</span></span></td>
      </tr>
      <tr>
        <td id="L180" class="blob-num js-line-number" data-line-number="180"></td>
        <td id="LC180" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

        </div>
      </div>
      <div class="modal-backdrop"></div>
    </div>
  </div>


    </div>

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://github.com/pricing" data-ga-click="Footer, go to pricing, text:pricing">Pricing</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.04273s from github-fe120-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <span class="octicon octicon-x"></span>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-f8473dece7242da6a20d52313634881b3975c52cebaa1e6c38157c0f26185691.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-693f19bce5a3e696744072d424d362b7168779d68164fef41e58b432df44d4a8.js"></script>
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <span class="octicon octicon-alert"></span>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
  </body>
</html>

