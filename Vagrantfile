# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
require 'pathname'

API_VERSION = '2'

raise 'NO DOCKER CONTAINER TARGET SPECIFIED.' unless ENV['DOCKER_CONTAINER_TARGET']
docker_container_target = ENV['DOCKER_CONTAINER_TARGET']

docker_create_args = [
  '--interactive',
  '--tty'
]

docker_container_image = "0dayinc/#{docker_container_target}"
docker_cmd = [
  '--login',
  '-c',
  'binwalk -h; bash'
]

Vagrant.configure(API_VERSION) do |config|
  config.ssh.username = 'root'
  config.vm.define docker_container_target do
    config.vm.synced_folder('.', '/vagrant', disabled: true)
    config.vm.provider :docker do |d|
      d.name = docker_container_target
      d.image = docker_container_image
      d.create_args = docker_create_args
      d.cmd = docker_cmd
      d.volumes = ['/tmp:/tmp']
      d.has_ssh = true
    end
  end
end
