# bsx-roles

A set of ansible rules aimed to install stuff from NoSQL/Hadoop world.

Used in several context:

 - KVM
 - LXC Container (Some playbook provided)
 - Bare metal
 - ...
 
Curently, only RHEL7/Centos7 is supported.

Also, some playbooks download jar from a 'misc' repository. To setup and populate with appropriate product distribution (tar or rpm. Refer to defaults/main.yml of each playbook)

## License

License terms may differ (Apache or GNU), depending of each role.

Please, refers to file header.

## Also included for convenience:

- yaegashi.blockinfile from [YAEGASHI Takeshi](https://github.com/yaegashi) (License: GPLv3+)


