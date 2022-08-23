


<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>DoDragDrop/DropTargetSample.ahk at master · AHK-just-me/DoDragDrop · GitHub</title>
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

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="25913217:0F6B:1A35CBDC:561554B5" name="octolytics-dimension-request_id" />

<meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />


  <meta class="js-ga-set" name="dimension1" content="Logged Out">
    <meta class="js-ga-set" name="dimension4" content="Current repo nav">




    <meta name="is-dotcom" content="true">
        <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

      <!-- </textarea> --><!-- '"` --><meta content="authenticity_token" name="csrf-param" />
<meta content="/W4ZucaDAAuwmnJON90IyNh5yYQdXV1VudbNiyAv7Z71vscUf7I1yO09PRxTGXY6JkEVhTZtBRqBSXGcEc4WGw==" name="csrf-token" />
    

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
      <a class="btn" href="/login?return_to=%2FAHK-just-me%2FDoDragDrop%2Fblob%2Fmaster%2Fsources%2FDropTargetSample.ahk" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
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
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone" class="inline-form js-clone-selector-form " data-form-nonce="7648e1d9d4774d311d1cc6f9c8180b70e2d4f906" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="xF0J1F+uYcfMmjwwyxEYnoe3wlSYEAGKJF2JdnCmzpD4QDDwuhG3xOAsl1dcWcka+UV037OYI/eKzig/HdoXOA==" /></div><button class="btn-link js-clone-selector" data-protocol="http" type="submit">HTTPS</button></form> or <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone" class="inline-form js-clone-selector-form " data-form-nonce="7648e1d9d4774d311d1cc6f9c8180b70e2d4f906" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="OIMMyy3FRul2RASlEIosTkbfI/d0GFCyo7L2oywHnRHgxre6FuX9Xlg//SEopCLZLUeqzPnnmP9ZiB62CKmzVw==" /></div><button class="btn-link js-clone-selector" data-protocol="subversion" type="submit">Subversion</button></form>.
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

          

<a href="/AHK-just-me/DoDragDrop/blob/67075c3e2468135f3b413bbf2b7bce06f65d08e7/sources/DropTargetSample.ahk" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:3cd1a5526939886a103fb702e2a62eec -->

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
               href="/AHK-just-me/DoDragDrop/blob/master/sources/DropTargetSample.ahk"
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
      <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/AHK-just-me/DoDragDrop" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">DoDragDrop</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/AHK-just-me/DoDragDrop/tree/master/sources" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">sources</span></a></span><span class="separator">/</span><strong class="final-path">DropTargetSample.ahk</strong>
    </div>
  </div>

<include-fragment class="commit commit-loader file-history-tease" src="/AHK-just-me/DoDragDrop/contributors/master/sources/DropTargetSample.ahk">
  <div class="file-history-tease-header">
    Fetching contributors&hellip;
  </div>

  <div class="participation">
    <p class="loader-loading"><img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" /></p>
    <p class="loader-error">Cannot retrieve contributors at this time</p>
  </div>
</include-fragment>
<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/AHK-just-me/DoDragDrop/raw/master/sources/DropTargetSample.ahk" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/AHK-just-me/DoDragDrop/blame/master/sources/DropTargetSample.ahk" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/AHK-just-me/DoDragDrop/commits/master/sources/DropTargetSample.ahk" class="btn btn-sm " rel="nofollow">History</a>
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
      142 lines (142 sloc)
      <span class="file-info-divider"></span>
    5.96 KB
  </div>
</div>

  

  <div class="blob-wrapper data type-autohotkey">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- Based on http://ahkscript.org/boards/viewtopic.php?f=5&amp;t=8700 by jballi</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- Modified by just me</span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-k">#NoEnv<span class="pl-s"></span></span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-k">#SingleInstance<span class="pl-s">, Force</span></span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">ListLines</span>, <span class="pl-k">Off</span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">SetBatchLines</span>, <span class="pl-k">-</span><span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- DragDrop constants -------------------------------------------------------------------------------------------------------------</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- DragDrop flags</span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line">DRAGDROP_S_DROP   <span class="pl-k">:=</span> <span class="pl-c1">0x40100</span> <span class="pl-c">; 262400</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">DRAGDROP_S_CANCEL <span class="pl-k">:=</span> <span class="pl-c1">0x40101</span> <span class="pl-c">; 262401</span></td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- DROPEFFECT flags</span></td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line">DROPEFFECT_NONE <span class="pl-k">:=</span> <span class="pl-c1">0</span> <span class="pl-c">;-- Drop target cannot accept the data.</span></td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line">DROPEFFECT_COPY <span class="pl-k">:=</span> <span class="pl-c1">1</span> <span class="pl-c">;-- Drop results in a copy. The original data is untouched by the drag source.</span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line">DROPEFFECT_MOVE <span class="pl-k">:=</span> <span class="pl-c1">2</span> <span class="pl-c">;-- Drag source should remove the data.</span></td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line">DROPEFFECT_LINK <span class="pl-k">:=</span> <span class="pl-c1">4</span> <span class="pl-c">;-- Drag source should create a link to the original data.</span></td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- Key state values (grfKeyState parameter)</span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line">MK_LBUTTON <span class="pl-k">:=</span> <span class="pl-c1">0x01</span>   <span class="pl-c">;-- The left mouse button is down.</span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line">MK_RBUTTON <span class="pl-k">:=</span> <span class="pl-c1">0x02</span>   <span class="pl-c">;-- The right mouse button is down.</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line">MK_SHIFT   <span class="pl-k">:=</span> <span class="pl-c1">0x04</span>   <span class="pl-c">;-- The SHIFT key is down.</span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line">MK_CONTROL <span class="pl-k">:=</span> <span class="pl-c1">0x08</span>   <span class="pl-c">;-- The CTRL key is down.</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line">MK_MBUTTON <span class="pl-k">:=</span> <span class="pl-c1">0x10</span>   <span class="pl-c">;-- The middle mouse button is down.</span></td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line">MK_ALT     <span class="pl-k">:=</span> <span class="pl-c1">0x20</span>   <span class="pl-c">;-- The ALT key is down.</span></td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; MK_BUTTON  := ?    ;-- Not documented.</span></td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- DragDrop includes --------------------------------------------------------------------------------------------------------------</span></td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line"><span class="pl-k">#Include<span class="pl-s"> IDropTarget.ahk</span></span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- GUI ----------------------------------------------------------------------------------------------------------------------------</span></td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">Gui</span>, <span class="pl-k">+</span><span class="pl-k">AlwaysOnTop</span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">Gui</span>, <span class="pl-k">Margin</span>, <span class="pl-c1">20</span>, <span class="pl-c1">20</span></td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">Gui</span>, <span class="pl-k">Add</span>, <span class="pl-k">ListView</span>, r20 w700 hwndhLV vLV, <span class="pl-k">#|</span>FormatNum<span class="pl-k">|</span>FormatName<span class="pl-k">|</span>TYMED<span class="pl-k">|</span>Size<span class="pl-k">|</span>Value</td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">Gui</span>, <span class="pl-k">Add</span>, <span class="pl-k">Text</span>, <span class="pl-k">xp</span> y<span class="pl-k">+</span><span class="pl-c1">2</span>, % <span class="pl-s"><span class="pl-pds">&quot;</span>   N/S = not supported<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">Gui</span>, <span class="pl-k">Show</span>, , <span class="pl-k">ListView</span> as Drop Target Example</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- Register the ListView as a drop potential target for OLE drag-and-drop operations.</span></td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">IDT_LV <span class="pl-k">:=</span> IDropTarget_Create(hLV, <span class="pl-s"><span class="pl-pds">&quot;</span>_LV<span class="pl-pds">&quot;</span></span>, [<span class="pl-c1">1</span>, <span class="pl-c1">15</span>]) <span class="pl-c">; CF_TEXT, CF_HDROP</span></td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line"><span class="pl-k">Return</span></td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line"><span class="pl-en">GUIClose:</span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line"><span class="pl-en">GUIEscape:</span></td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line"><span class="pl-c">;-- Revoke the registration of the ListView as a potential target for OLE drag-and-drop operations.</span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line">IDT_LV.RevokeDragDrop()</td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">Gui</span>, <span class="pl-k">Destroy</span></td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line"><span class="pl-k">ExitApp</span></td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; Drop user function called by IDropTarget on drop</span></td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line"><span class="pl-c">; ==================================================================================================================================</span></td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line"><span class="pl-en">IDropTargetOnDrop_LV</span>(<span class="pl-s">TargetObject, pDataObj, KeyState, X, Y, DropEffect</span>) {</td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; Standard clipboard formats</span></td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF <span class="pl-k">:=</span> {<span class="pl-c1">1</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_TEXT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">2</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_BITMAP<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">3</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_METAFILEPICT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">4</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_SYLK<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">5</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_DIF<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">6</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_TIFF<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">7</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_OEMTEXT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">8</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_DIB<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">9</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>CF_PALETTE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">10</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_PENDATA<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">11</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_RIFF<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">12</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_WAVE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">13</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_UNICODETEXT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">14</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_ENHMETAFILE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">15</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_HDROP<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">16</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_LOCALE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">17</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_DIBV5<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">0x0080</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_OWNERDISPLAY<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">0x0081</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_DSPTEXT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">0x0082</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_DSPBITMAP<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">0x0083</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_DSPMETAFILEPICT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">0x008E</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>CF_DSPENHMETAFILE<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; TYMED enumeration</span></td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> TM <span class="pl-k">:=</span> {<span class="pl-c1">1</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>HGLOBAL<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">2</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>FILE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">4</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>ISTREAM<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">8</span>:  <span class="pl-s"><span class="pl-pds">&quot;</span>ISTORAGE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">16</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>GDI<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">32</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>MFPICT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line">               , <span class="pl-c1">64</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>ENHMF<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_NATIVE <span class="pl-k">:=</span> <span class="pl-c1">A_IsUnicode</span> ? <span class="pl-c1">13</span> : <span class="pl-c1">1</span> <span class="pl-c">; CF_UNICODETEXT  : CF_TEXT</span></td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; &quot;Private&quot; formats don&#39;t get GlobalFree()&#39;d</span></td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_PRIVATEFIRST <span class="pl-k">:=</span> <span class="pl-c1">0x0200</span></td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_PRIVATELAST  <span class="pl-k">:=</span> <span class="pl-c1">0x02FF</span></td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; &quot;GDIOBJ&quot; formats do get DeleteObject()&#39;d</span></td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_GDIOBJFIRST  <span class="pl-k">:=</span> <span class="pl-c1">0x0300</span></td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_GDIOBJLAST   <span class="pl-k">:=</span> <span class="pl-c1">0x03FF</span></td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; &quot;Registered&quot; formats</span></td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_REGISTEREDFIRST <span class="pl-k">:=</span> <span class="pl-c1">0xC000</span></td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Static</span> CF_REGISTEREDLAST  <span class="pl-k">:=</span> <span class="pl-c1">0xFFFF</span></td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">   <span class="pl-c1">Gui</span>, <span class="pl-k">+</span><span class="pl-k">OwnDialogs</span></td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">   <span class="pl-c">; IDataObject_SetPerformedDropEffect(pDataObj, DropEffect)</span></td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">   <span class="pl-c1">LV_Delete</span>()</td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">   <span class="pl-c1">GuiControl</span>, <span class="pl-k">-</span><span class="pl-k">Redraw</span>, LV</td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">If</span> (pEnumObj <span class="pl-k">:=</span> IDataObject_EnumFormatEtc(pDataObj)) {</td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">While</span> IEnumFORMATETC_Next(pEnumObj, FORMATETC) {</td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line">         IDataObject_ReadFormatEtc(FORMATETC, Format, Device, Aspect, Index, <span class="pl-k">Type</span>)</td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line">         TYMED <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>NONE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">For</span> Index, Value <span class="pl-k">In</span> TM {</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">            <span class="pl-k">If</span> (<span class="pl-k">Type</span> <span class="pl-k">&amp;</span> Index) {</td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line">               TYMED <span class="pl-k">:=</span> Value</td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">               <span class="pl-k">Break</span></td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line">            }</td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line">         }</td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">If</span> (Format <span class="pl-k">&gt;</span><span class="pl-k">=</span> CF_REGISTEREDFIRST) <span class="pl-k">&amp;&amp;</span> (Format <span class="pl-k">&lt;</span><span class="pl-k">=</span> CF_REGISTEREDLAST) {</td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line">            <span class="pl-c1">VarSetCapacity</span>(Name, <span class="pl-c1">520</span>, <span class="pl-c1">0</span>)</td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line">            <span class="pl-k">If</span> <span class="pl-k">!</span><span class="pl-c1">DllCall</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>GetClipboardFormatName<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>, Format, <span class="pl-s"><span class="pl-pds">&quot;</span>Str<span class="pl-pds">&quot;</span></span>, Name, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">260</span>)</td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line">               Name <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>*REGISTERED<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line">         }</td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">Else</span> <span class="pl-k">If</span> (Format <span class="pl-k">&gt;</span><span class="pl-k">=</span> CF_GDIOBJFIRST) <span class="pl-k">&amp;&amp;</span> (Format <span class="pl-k">&lt;</span><span class="pl-k">=</span> CF_GDIOBJLAST)</td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line">            Name <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>*GDIOBJECT<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">Else</span> <span class="pl-k">If</span> (Format <span class="pl-k">&gt;</span><span class="pl-k">=</span> CF_PRIVATEFIRST) <span class="pl-k">&amp;&amp;</span> (Format <span class="pl-k">&lt;</span><span class="pl-k">=</span> CF_PRIVATELAST)</td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line">            Name <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>*PRIVATE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">Else</span> <span class="pl-k">If</span> <span class="pl-k">!</span>(Name <span class="pl-k">:=</span> CF[Format])</td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line">            Name <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>*UNKNOWN<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line">         IDataObject_GetData(pDataObj, FORMATETC, Size, Data)</td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">If</span> (Size <span class="pl-k">=</span> <span class="pl-k">-</span><span class="pl-c1">1</span>)</td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line">            Size <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>N/S<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line">         <span class="pl-c">; Example for getting values out of the returned binary Data</span></td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line">         Value <span class="pl-k">:=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>N/S<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">If</span> Format <span class="pl-k">In</span> <span class="pl-c1">1</span>,<span class="pl-c1">7</span>,<span class="pl-c1">13</span>,<span class="pl-c1">15</span>,<span class="pl-c1">16</span></td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line">         {</td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line">            <span class="pl-k">If</span> (Format <span class="pl-k">=</span> CF_NATIVE)       <span class="pl-c">; CF_TEXT or CF_UNICODETEXT</span></td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line">               Value <span class="pl-k">:=</span> <span class="pl-c1">StrGet</span>(<span class="pl-k">&amp;</span>Data)</td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line">            <span class="pl-k">Else</span> <span class="pl-k">If</span> (Format <span class="pl-k">=</span> <span class="pl-c1">16</span>)         <span class="pl-c">; CF_LOCALE</span></td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line">               Value <span class="pl-k">:=</span> <span class="pl-c1">NumGet</span>(Data, <span class="pl-s"><span class="pl-pds">&quot;</span>UInt<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line">            <span class="pl-k">Else</span> <span class="pl-k">If</span> (Format <span class="pl-k">=</span> <span class="pl-c1">15</span>) {       <span class="pl-c">; CF_HDROP</span></td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line">               <span class="pl-c1">LV_Add</span>(<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-c1">A_Index</span>, Format, Name, TYMED, Size, <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code blob-code-inner js-file-line">               <span class="pl-k">If</span> IDataObject_GetDroppedFiles(pDataObj, Files) {</td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code blob-code-inner js-file-line">                  <span class="pl-k">For</span> Each, File <span class="pl-k">In</span> Files</td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code blob-code-inner js-file-line">                     <span class="pl-c1">LV_Add</span>(<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, File)</td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code blob-code-inner js-file-line">               }</td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code blob-code-inner js-file-line">               <span class="pl-k">Continue</span></td>
      </tr>
      <tr>
        <td id="L130" class="blob-num js-line-number" data-line-number="130"></td>
        <td id="LC130" class="blob-code blob-code-inner js-file-line">            }</td>
      </tr>
      <tr>
        <td id="L131" class="blob-num js-line-number" data-line-number="131"></td>
        <td id="LC131" class="blob-code blob-code-inner js-file-line">         }</td>
      </tr>
      <tr>
        <td id="L132" class="blob-num js-line-number" data-line-number="132"></td>
        <td id="LC132" class="blob-code blob-code-inner js-file-line">         <span class="pl-c1">LV_Add</span>(<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-c1">A_Index</span>, Format, Name, TYMED, Size, Value)</td>
      </tr>
      <tr>
        <td id="L133" class="blob-num js-line-number" data-line-number="133"></td>
        <td id="LC133" class="blob-code blob-code-inner js-file-line">      }</td>
      </tr>
      <tr>
        <td id="L134" class="blob-num js-line-number" data-line-number="134"></td>
        <td id="LC134" class="blob-code blob-code-inner js-file-line">      ObjRelease(pEnumObj)</td>
      </tr>
      <tr>
        <td id="L135" class="blob-num js-line-number" data-line-number="135"></td>
        <td id="LC135" class="blob-code blob-code-inner js-file-line">   }</td>
      </tr>
      <tr>
        <td id="L136" class="blob-num js-line-number" data-line-number="136"></td>
        <td id="LC136" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Loop</span>, % <span class="pl-c1">LV_GetCount</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>Column<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L137" class="blob-num js-line-number" data-line-number="137"></td>
        <td id="LC137" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">LV_ModifyCol</span>(<span class="pl-c1">A_Index</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>AutoHdr<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L138" class="blob-num js-line-number" data-line-number="138"></td>
        <td id="LC138" class="blob-code blob-code-inner js-file-line">   <span class="pl-c1">GuiControl</span>, <span class="pl-k">+</span><span class="pl-k">Redraw</span>, LV</td>
      </tr>
      <tr>
        <td id="L139" class="blob-num js-line-number" data-line-number="139"></td>
        <td id="LC139" class="blob-code blob-code-inner js-file-line">   Effect <span class="pl-k">:=</span> {<span class="pl-c1">0</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>NONE<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">1</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>COPY<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">2</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>MOVE<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">3</span>: <span class="pl-s"><span class="pl-pds">&quot;</span>LINK<span class="pl-pds">&quot;</span></span>}[DropEffect]</td>
      </tr>
      <tr>
        <td id="L140" class="blob-num js-line-number" data-line-number="140"></td>
        <td id="LC140" class="blob-code blob-code-inner js-file-line">   <span class="pl-c1">SB_SetText</span>(<span class="pl-s"><span class="pl-pds">&quot;</span>   DropEffect: <span class="pl-pds">&quot;</span></span> . Effect)</td>
      </tr>
      <tr>
        <td id="L141" class="blob-num js-line-number" data-line-number="141"></td>
        <td id="LC141" class="blob-code blob-code-inner js-file-line">   <span class="pl-k">Return</span> DropEffect</td>
      </tr>
      <tr>
        <td id="L142" class="blob-num js-line-number" data-line-number="142"></td>
        <td id="LC142" class="blob-code blob-code-inner js-file-line">}</td>
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
      <li>&copy; 2015 <span title="0.06263s from github-fe121-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
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

