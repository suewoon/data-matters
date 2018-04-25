#!/usr/bin/env bash
flask db upgrade
flask translate compile
sudo supervisorctl start datamatters