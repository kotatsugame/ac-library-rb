# Fenwick Tree

**別名** BIT(Binary Indexed Tree)

長さ`N` の配列に対し、

- 要素の`1`点変更
- 区間の要素の総和

を`O(logN)`で求めることが出来るデータ構造です。

## コンストラクタ

```rb
fw = FenwickTree.new(arg)
```

引数は`Integer`または`Array`です。

1. 引数が`Integer`クラスの`n`のとき、長さ`n`の全ての要素が`0`で初期化された配列を作ります。 
2. 引数が長さ`n`の`Array`クラスの配列`a`のとき、`a`で初期化された配列を作ります。

配列の添字は、0-based indexです。
 
**計算量** `O(n)` (引数が`Array`でも同じです)

## add(pos, x)

```rb
fw.add(pos, x)
```

`a[pos] += x`を行います。

`pos`は、0-based indexです。

**制約** `0 ≦　pos < n`
**計算量** `O(logn)`

## sum(l, r) ->Integer

```rb
fw.sum(l, r)
```

`a[l] + a[l - 1] + ... + a[r - 1]`を返します。

引数は、半開区間です。

実装として、内部で`_sum(r) - _sum(l)`を返しています。

**制約** `0 ≦　l ≦ r ≦ n`
**計算量** `O(logn)`

## _sum(pos) -> Integer

```rb
fw._sum(pos)
```

`a[0] + a[1] + ... + a[pos - 1]`を返します。

**計算量** `O(logn)`

## Verified

[B \- Fenwick Tree](https://atcoder.jp/contests/practice2/tasks/practice2_b)

https://atcoder.jp/contests/practice2/submissions/17074108 (1272ms)

## 開発者、内部実装を読みたい人向け

本家ACLライブラリの実装は、内部の配列も0-based indexですが、

本ライブラリは定数倍改善のため、内部の配列への添字が1-based indexです。
