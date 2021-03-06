# Segtree

セグメント木です。

## 特異メソッド

### new(arg, e, &op) -> Segtree

```rb
seg = Segtree.new(arg, e) { |x, y| ... }
```

第1引数は、`Integer`または`Array`です。

- 第1引数が`Integer`の`n`のとき、長さ`n`・初期値`e`のセグメント木を作ります。
- 第1引数が長さ`n`の`Array`の`a`のとき、`a`をもとにセグメント木を作ります。

第2引数は単位元`e`で、ブロックで二項演算`op(x, y)`を定義することで、モノイドを定義する必要があります。

**計算量** `O(n)`

<details>
<summary>モノイドの設定コード例</summary>

```rb
n   = 10**5
inf = (1 << 60) - 1 

Segtree.new(n, 0) { |x, y| x.gcd y } # gcd
Segtree.new(n, 1) { |x, y| x.lcm y } # lcm
Segtree.new(n, -inf) { |x, y| [x, y].max } # max
Segtree.new(n,  inf) { |x, y| [x, y].min } # min
Segtree.new(n, 0) { |x, y| x | y } # or
Segtree.new(n, 1) { |x, y| x * y } # prod
Segtree.new(n, 0) { |x, y| x + y } # sum
```

</details>

## インスタンスメソッド

### set

```rb
seg.set(pos, x)
```

`a[pos] に x`を代入します。

**計算量** `O(logn)`

### get

```rb
seg.get(pos)
```

`a[pos]`を返します。

**計算量** `O(1)`

### prod

```rb
seg.prod(l, r)
```

`op(a[l], ..., a[r - 1])` を返します。

**制約** `0 ≦ l ≦ r ≦ n`

**計算量** `O(logn)`

### all_prod

```rb
seg.all_prod
```

`op(a[0], ..., a[n - 1])` を返します。

**計算量** `O(1)`

### max_right(l, &f) -> Integer

```ruby
seg.max_right(l, &f)
```

Segtree上で二分探索をします。

### min_left(r, &f) -> Integer

```ruby
seg.min_left(r, &f)
```

Segtree上で二分探索をします。

## Verified

[ALPC: J \- Segment Tree](https://atcoder.jp/contests/practice2/tasks/practice2_j)

## 参考リンク

- 当ライブラリ
  - [当ライブラリの実装コード segtree.rb](https://github.com/universato/ac-library-rb/blob/master/lib/segtree.rb)
  - [当ライブラリのテストコード segtree.rb](https://github.com/universato/ac-library-rb/blob/master/test/segtree_test.rb)
- 本家
  - [本家ライブラリのドキュメント segtree.md(GitHub)](https://github.com/atcoder/ac-library/blob/master/document_ja/segtree.md)
  - [本家のドキュメント appendix.md(GitHub)](https://github.com/atcoder/ac-library/blob/master/document_ja/appendix.md)
  - [本家ライブラリの実装コード segtree.hpp(GitHub)](https://github.com/atcoder/ac-library/blob/master/atcoder/segtree.hpp)
  - [本家ライブラリのテストコード segtree_test.cpp(GitHub)](https://github.com/atcoder/ac-library/blob/master/test/unittest/segtree_test.cpp)
  - [本家ライブラリのサンプルコード segtree_practice.cpp(GitHub)](https://github.com/atcoder/ac-library/blob/master/test/example/segtree_practice.cpp)
- セグメントツリーについて
  - [セグメント木をソラで書きたいあなたに \- hogecoder](https://tsutaj.hatenablog.com/entry/2017/03/29/204841)

## 本家ライブラリとの違い等

基本的に、本家の実装に合わせています。

内部実装に関しても、変数`@d`の0番目の要素には必ず単位元`@e`が入ります。

### 変数名の違い

Rubyには`p`メソッドがあるので、引数`p`について、`p`ではなくpositionの`pos`を変数名として使いました。

同様に、本家の変数`size`を、わかりやすさから`leaf_size`としています。

### `ceil_pow2`ではなく、`bit_length`

本家C++ライブラリは独自定義の`internal::ceil_pow2`関数を用いてますが、本ライブラリではRuby既存のメソッド`Integer#bit_length`を用いています。そちらの方が計測した結果、高速でした。
