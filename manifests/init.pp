# Install Emacs.app from homebrew into /Applications
#
# Examples
# include emacs
#
# emacs::package_ensure: "24.4"

class emacs(
  $package_ensure = $::emacs::params::package_ensure,
  $install_options = $::emacs::params::install_options,
  $install_path = $::emacs::params::install_path,
  $link_path = $::emacs::params::link_path,
)
inherits emacs::params {

  include ::emacs::install
  include ::emacs::config
  
  anchor { 'emacs::start': }
  anchor { 'emacs::end': }

  Anchor['emacs::start'] ->
  Class['emacs::install'] ->
  Class['emacs::config'] ->
  Anchor['emacs::end']
  }
  
