# habichef_generator

This is a ChefDK "Generator Cookbook" designed to facilitate creating "HabiChef" projects.

Long story short, I really like the idea of "Chef cookbooks as project Templates".  I'd like to convince the Chef folks to help me figure out how to extend `chef generate` a la [Cookiecutter](https://cookiecutter.readthedocs.io/en/latest/) to be able to generate "arbitrary" templates.

If you already have [ChefDK](https://downloads.chef.io/chefdk) or [ChefWKS](https://www.chef.sh/), (which, even if you aren't using Chef, why aren't you using [Kitchen](https://kitchen.ci/)? Which comes as part of ChefDK...) it's much easier to use the built-in generator than to go and install another tool...

## Usage

### Setup

Let's setup a demo dir and call it `habidemo`.  Hopefully unique enough you don't already have that in your homedir, and short enough it's not too crazy to type.  We're going to assume a bash or otherwise POSIX compliant shell.  Please adapt commands as necessary.

```
$ cd ~
$ mkdir -p ~/habidemo/demo
$ cd ~/habidemo
```

#### Clone the repo

```
$ git clone git@github.com:qubitrenegade/habichef_generator_demo.git
```

### Run ChefDK Generator

```
$ chef generate cookbook ../demo/myhabichefproject -g habichef_generator_demo/generator_cookbook/habichef_generator
```

You can optionally set `HAB_ORIGIN` environment variable or pass `-a hab_origin=<your origin>` (this example sets both for demonstrative purposes only.  You do not need to set both. If both are set `-a` takes precedence over `ENV['HAB_ORIGIN']`)

```
HAB_ORIGIN=foo chef generate cookbook ../test/foo -a hab_origin='foo' -g .
```

### Run the Cookbook

#### Create environment.json

#### Run the chef-client

(untested)
```
$ chef-client --local-mode --recipe-url='https://github.com/qubitrenegade/habichef_generator_demo/cookbooks/habichef_generator' --json-attributes demo.json
```

This seems to work.
```
sudo chef-client -z --runlist 'recipe[habichef_generator]' -c client.rb
```
