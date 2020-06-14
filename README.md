Ansible Materialize
===================
A collection of Ansible playbooks and roles to manage hosts for The Obscure Organization.

## Directions
On the host you wish to install Ansible on, run `bin/bootstrap.sh`. This will install Ansible and install the ansible-galaxy playbooks defined in `requirements.yml`. Then run `bin/ansible-local.sh` to test that Ansible is working for the local host. Once you are satisfied that is working, you can run `bin/ansible-network.sh` to run it versus the collection of hosts defined on the Ansible server in `/etc/ansible/hosts`.

## Gotchas
This is built first and foremost as operational support for `obscure.org` hosts. Documentation may be sketchy or absent. See the files in `/etc/ansible` on the Ansible server for Obscure if you have access to see how the actual hosts are configured.

## Acknowledgements
Thanks go to Scott Hanselman for the [suggestion and instructions on switching the git default branch from master to main](https://www.hanselman.com/blog/EasilyRenameYourGitDefaultBranchFromMasterToMain.aspx). This repository transitioned to using `main` as its default branch on 2020-06-14.

## License
Copyright &copy; 2019 by The Obscure Organization

This software is MIT licensed, see [`LICENSE`](LICENSE) for details.
