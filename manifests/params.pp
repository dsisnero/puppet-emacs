class emacs::params {

  $package_ensure = 'present'

  $version = hiera('emacs::package_ensure')
 
  case $::osfamily {
    'Darwin': {
      $install_options = hiera('emacs::install_options', ['--with-cocoa', '--with-ctags'])
      $install_path = hiera('emacs::install_path', "${homebrew::config::installdir}/Cellar/emacs/${version}/Emacs.app")
      $link_path = '/Applications/Emacs.app'
      }
    default: { $package_install_options = []}
    }

    }
    
