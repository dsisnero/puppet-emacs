class emacs::config {
    $home_directory = "/Users/${luser}/"

    file {
      "${home_directory}/.emacs":
        ensure => present,
        require => Class['emacs::install'],
        content => '(load "~/.emacs24.d/init.el")',        
    }

    repository {
      "${home_directory}/.emacs24.d":
        source => 'dsisnero/.emacs24.d'
    }

  

    file { "EmacsAppLink":
      path => $::emacs::link_path,
      ensure => link,
      target => $::emacs::install_path,
      require => Class['emacs::install'],
    }

    }
