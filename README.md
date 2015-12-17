# Fxkeb

Get USD from KRW based on fx rate infomation from fxkeb. 

외환은행 사이트에서 환율정보를 구해서, 지정한 원화에 대한 USD를 구합니다.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fxkeb'
gem 'fxkeb', git: 'git://github.com/jinto/fxkeb.git' # lastest version
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fxkeb


# fxkeb

## Get USD from KRW
```
Fxkeb.fx_krw2usd(krw) 
```

* 만일 fxkeb.com 사이트가 동작하지 않으면, "usd=krw/1000"으로 동작합니다.
* If fxkeb.com is not up, fixed rate "krw/1000" is applied.




# 참고
http://blog.remotty.com/blog/2015/12/14/rubygem-create-guide/

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

