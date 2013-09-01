# rubybasic-gem

RubyBasic installer and executer.

### RubyBasic?

You can write interactive applications be simplified by RubyBasic.

```ruby:hello.rb
def draw
  text 'Hello, rubybasic!', 100, 100
  circle 300, 100, 50
end
```

画像を貼る。

To move the circle is very simple.

```ruby:hello.rb
def setup
  @x = 0
end

def update
  @x += 1
end

def draw
  text 'Hello, rubybasic!', 100, 100
  circle @x, 100, 50
end
```

画像を貼る。(gifアニメ)

Many sample codes. [drawing](https://github.com/ongaeshi/rubybasic-sample/blob/master/drawing.rb) and [shooting](https://github.com/ongaeshi/rubybasic-sample/blob/master/mouse_shooting.rb).

画像を貼る。(お絵描き)

## Installation

    $ gem install rubybasic-gem

## Usage

### Install RubyBasic.app

    $ rubybasic install --latest
    
### Installed?

    $ rubybasic list
    osx (0.0.3)
    
### Write a code

```ruby:hello.rb
def draw
  text 'Hello, rubybasic!', 100, 100
  circle 300, 100, 50
end
```

### Execute script

    $ rubybasic exec hello.rb

## Sample Code

[rubybasic-sample](https://github.com/ongaeshi/rubybasic-sample)

    $ git clone https://github.com/ongaeshi/rubybasic-sample
    $ cd rubybasic-sample
    $ rubybasic exec mouse-shooting.rb

## Support

- [osx](https://github.com/ongaeshi/rubybasic-osx)
- win
- linux
- ios
- android

## Features

- It's made width mruby + openFrameworks.
  - Not a library. It's an application that move independently.
- Benefits that can be expected.
  - Run on multiple platforms the same code
  - Run in the mobile device as well as PC
  - Hide the code together in the binary file

## Special Thanks

- [mruby](https://github.com/mruby/mruby)
- [openFrameworks](http://www.openframeworks.cc)
