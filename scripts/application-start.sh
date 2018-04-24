#!/usr/bin/env bash
sudo initctl list
sudo initctl start dashboard
sudo initctl status myproject
sudo service nginx restart