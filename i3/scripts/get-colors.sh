#!/bin/bash
wallpaper=$(sed '2q;d' ~/.fehbg | cut -d " " -f 4 | tr -d "'") 

wal -i $wallpaper
