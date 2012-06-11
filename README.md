# hamlize

Simple `bash` script for calling `html2haml` on your Rails view files.

## Usage
    
### 1. Clone this repo
    
    git clone git://github.com/zhifengkoh/hamlize_view.git

### 2. Add the script to your `$PATH`

Inside `.bash_profile` or `.bashrc`:

    export PATH=$PATH:path/to/hamlize_view

### 3. `cd` into your rails project
    
    $ cd ~/workspace/my_rails_app

### 4. Hamlize

Convert the default ERB templates to Haml

    $ hamlize_view.sh users
    
    Checking for haml and html2haml dependencies...
    -----------------------------------------------
    Success: haml gem found: haml (3.1.2, 3.1.1)
    Success: hpricot gem found: hpricot (0.8.6)
    Success: ruby_parser gem found: ruby_parser (2.3.1)

    Converting .html.erb file(s) into haml format
    ---------------------------------------------
    No specific view file was specified. Converting automatically-generated ERB views...
    Converting index.html.erb into index.haml...
    Success: app/views/users/index.haml
    Converting edit.html.erb into edit.haml...
    Success: app/views/users/edit.haml
    Converting new.html.erb into new.haml...
    Success: app/views/users/new.haml
    Converting _form.html.erb into _form.haml...
    Success: app/views/users/_form.haml
    Converting show.html.erb into show.haml...
    Success: app/views/users/show.haml

Convert a specific view file from ERB to Haml

    $ hamlize_view.sh users relationships
    
    Checking for haml and html2haml dependencies...
    -----------------------------------------------
    Success: haml gem found: haml (3.1.2, 3.1.1)
    Success: hpricot gem found: hpricot (0.8.6)
    Success: ruby_parser gem found: ruby_parser (2.3.1)

    Converting .html.erb file(s) into haml format
    ---------------------------------------------
    Converting relaitonships.html.erb into relaitonships.haml...
    Success: app/views/users/relaitonships.haml

## Coming Soon

These things may never happen, since this is a really simple utility.

- Call from any rails project subdirectory
- Call from anywhere
- Ruby script instead of bash
