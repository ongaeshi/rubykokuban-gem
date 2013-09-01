# rubybasic-gem

RubyBasic installer and executer.

### RubyBasic?

RubyBasicを使うと簡単にインタラクティブなアプリケーションを書く事が出来ます。

```ruby:hello.rb
def draw
  text 'Hello, rubybasic!', 100, 100
  circle 300, 100, 50
end
```

画像を貼る。

動かすことも簡単です。

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

[お絵描きソフト](https://github.com/ongaeshi/rubybasic-sample/blob/master/drawing.rb)や[シューティングゲーム](https://github.com/ongaeshi/rubybasic-sample/blob/master/mouse_shooting.rb)も。

画像を貼る。(お絵描き)

## Features

- mruby + openFrameworks で作られています
- 将来的に以下のようなメリットを期待しています
  - バイナリファイルにまとめてコードを隠すことが出来ます
  - 同じコードを複数のプラットフォームで動かすことが出来ます
  - PCだけでなくモバイルデバイスでも動かせます

## Support

- [osx](https://github.com/ongaeshi/rubybasic-osx)
- win
- linux
- ios
- android

## Installation

    $ gem install rubybasic-gem

## Usage

### Install RubyBasic.app/

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

## Special Thanks

- [mruby](https://github.com/mruby/mruby)
- [openFrameworks](http://www.openframeworks.cc)
