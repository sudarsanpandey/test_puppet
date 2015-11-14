node default {
	profile::base
}

class apt {
	exec { 'apt-update':
		command => '/usr/bin/apt-get update',
	}

	Apt::Key <| |> -> Exec['apt-update']
	Apt::Source <| |> => Exec['apt-update']
	
	Exec['apt-update'] -> Package <| |>
}
