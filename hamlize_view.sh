#!/bin/bash

######## Global Vars
proceed=true

######## Functions
function check_gem() {
  local gem_name=$1
  local gem_version=$(gem list | grep $gem_name)
  if [[ "$gem_version" == *"$gem_name"* ]]; then
    echo "Success: $gem_name gem found: $gem_version"
  else
    echo "ERROR: No $gem_name gem found"
    proceed=false
  fi
}

function hamlize() {
  local view=$1
  local viewfile=$2
  if [ -n "$viewfile" ]; then # non-zero-length second argument
    hamlize_view "$view" "$viewfile"
  else
    echo "No specific view file was specified. Converting automatically-generated ERB views..."
    hamlize_view "$view" "index"
    hamlize_view "$view" "edit"
    hamlize_view "$view" "new"
    hamlize_view "$view" "_form"
    hamlize_view "$view" "show"
  fi
}

function hamlize_view() {
  local view=$1
  local viewfile=$2
  local path_prefix="app/views/$view/$viewfile"
  local erb="html.erb"
  local haml="haml"
  if [ -e "$path_prefix.$erb" ]; then
    echo "Converting $viewfile.$erb into $viewfile.$haml..."
    html2haml "$path_prefix.$erb" "$path_prefix.$haml"
    rm "$path_prefix.$erb"
    echo "Success: $path_prefix.$haml"
  else
    echo "ERROR: No ERB template found at $path_prefix.$erb"
  fi
}

######## Script

#### Verify that haml and html2haml dependent gems are installed
echo
echo "Checking for haml and html2haml dependencies..."
echo "-----------------------------------------------"

check_gem haml
check_gem hpricot
check_gem ruby_parser

if ! $proceed ; then
  echo "It appears you are missing one or more gem dependencies. If you are using RVM, ensure you are using the correct gemset."
  exit
fi

#### Execute on rails project_name and view_name
echo
echo "Converting .html.erb file(s) into haml format"
echo "---------------------------------------------"
# Check if we're inside a Rails project # at the moment, only working from the project root folder
if [ ! -e "script/rails" ]; then
  echo "ERROR: You need to be in your rails project root folder. Navigate there, then try again."
  exit
fi
hamlize "$1" "$2"


