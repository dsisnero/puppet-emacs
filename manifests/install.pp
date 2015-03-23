class emacs::install {

  require 'homebrew'

  package { 'emacs':
    ensure => $::emacs::package_ensure,
    install_options => $::emacs::install_options
  }
  }
