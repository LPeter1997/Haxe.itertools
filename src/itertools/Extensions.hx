package itertools;

import itertools.GroupByIterator.Grouping;
import itertools.EnumerateIterator.Indexed;
import itertools.ZipIterator.Pair;
import haxe.ds.Option;

/**
    Extension functions to provide a fluent iterator API. Use with:
    ```
    using itertools.Extensions;
    ```
**/
class Extensions {
    /**
        Collects the elements of an iterable to an `Array`.

        @param it The iterable to collect the elements of.
        @returns The items of `it` collected into an `Array`.
    **/
    public static function toArray<T>(it:Iterable<T>):Array<T> {
        var result = new Array();
        for (i in it)
            result.push(i);
        return result;
    }

    /**
        Collects the elements of an iterable to a `Map` with a given key and
        value selector.

        @param it The iterable to collect the elements of.
        @param keySel The function to select the key from the elements of `it`.
        @param valSel The function to select the value from the elements of
            `it`.
        @returns The items of `it` collected into a `Map`.
    **/
    @:generic
    public static function toMapProj<T, K, V>(it:Iterable<T>, keySel:T->K, valSel:T->V):Map<K, V> {
        var result = new Map<K, V>();
        for (i in it)
            result.set(keySel(i), valSel(i));
        return result;
    }

    /**
        Collects the elements of an iterable to a `Map` with a given key
        selector.

        @param it The iterable to collect the elements of.
        @param keySel The function to select the key from the elements of `it`.
        @returns The items of `it` collected into a `Map`.
    **/
    @:generic
    public static function toMap<T, K>(it:Iterable<T>, keySel:T->K):Map<K, T> {
        var result = new Map<K, T>();
        for (i in it)
            result.set(keySel(i), i);
        return result;
    }

    /**
        Joins iterable elements with a separator into a string.

        The elements are added using `StringBuf.add`.

        @param it The iterable to join the elements of.
        @param sep The separator string.
        @returns The items of `it` joined into a `String`, separated by `sep`.
    **/
    public static function join<T>(it:Iterable<T>, sep:String):String {
        var result = new StringBuf();
        var iterator = it.iterator();
        if (iterator.hasNext()) {
            result.add(iterator.next());
            while (iterator.hasNext()) {
                result.add(sep);
                result.add(iterator.next());
            }
        }
        return result.toString();
    }

    /**
        Retrieves the first element of an iterable, if any.

        @param it The iterable to retrieve the first element of.
        @returns The first element of `it`, or `None`, if `it` was empty.
    **/
    public static function first<T>(it:Iterable<T>):Option<T> {
        var iterator = it.iterator();
        return if (iterator.hasNext()) Some(iterator.next()) else None;
    }

    /**
        Retrieves the last element of an iterable, if any.

        @param it The iterable to retrieve the last element of.
        @returns The last element of `it`, or `None`, if `it` was empty.
    **/
    public static function last<T>(it:Iterable<T>):Option<T> {
        var iterator = it.iterator();
        var l = None;
        while (iterator.hasNext())
            l = Some(iterator.next());
        return l;
    }

    /**
        Retrieves the nth element of an iterable, if any.

        @param it The iterable to retrieve the nth element of.
        @param n The 0-based index of the element to retrieve.
        @returns The `n`th element of `it`, or `None`, if `it` was empty.
    **/
    public static function nth<T>(it:Iterable<T>, n:Int):Option<T> {
        var iterator = it.iterator();
        while (n > 0 && iterator.hasNext()) {
            iterator.next();
            --n;
        }
        return if (iterator.hasNext()) Some(iterator.next()) else None;
    }

    /**
        Checks, if a given predicate is true for all elements of an iterable.

        @param it The iterable that contains the elements to check the predicate
            for.
        @returns `true`, if all elements of `it` returned `true` for `pred`,
            `false` otherwise.
    **/
    public static function all<T>(it:Iterable<T>, pred:T->Bool):Bool {
        for (i in it) {
            if (!pred(i))
                return false;
        }
        return true;
    }

    /**
        Checks, if a given predicate is true for any element of an iterable.

        @param it The iterable that contains the elements to check the predicate
            for.
        @returns `true`, if any element of `it` returned `true` for `pred`,
            `false` otherwise.
    **/
    public static function any<T>(it:Iterable<T>, pred:T->Bool):Bool {
        for (i in it) {
            if (pred(i))
                return true;
        }
        return false;
    }

    /**
        Counts the number of elements in an iterable.

        @param it The iterable to count the number of elements of.
        @returns The number of elements in `it`.
    **/
    public static function count<T>(it:Iterable<T>):Int {
        var cnt = 0;
        for (_ in it)
            ++cnt;
        return cnt;
    }

    /**
        Attempts to find the first element in an iterable that matches the given
        predicate.

        @param it The iterable to search.
        @param pred The predicate to search elements with.
        @returns The first element of `it`, where `pred` returns `true`, `None`
            otherwise.
    **/
    public static function find<T>(it:Iterable<T>, pred:T->Bool):Option<T> {
        for (i in it) {
            if (pred(i))
                return Some(i);
        }
        return None;
    }

    /**
        Filters and maps an iterable by transforming to an `Optional<U>`, and
        only keeping `Some(U)`.

        @param it The iterable to filter and map.
        @param f The function to use for transforming.
        @returns The iterable that maps and filters `it` with `f`.
    **/
    public static function filterMap<T, U>(it:Iterable<T>, f:T->Option<U>):Iterable<U>
        return map(filter(map(it, f), x -> switch (x) {
            case Some(x): true;
            case None: false;
        }), x -> switch (x) {
            case Some(x): x;
            case None: throw new IteratorException("Impossible!");
        });

    /**
        Maps the elements of an iterable using a transformer function.

        @param it The iterable to transform the elements of.
        @param f The transformer function.
        @returns The iterable that uses `f` to transform each element of `it`.
    **/
    public static function map<T, U>(it:Iterable<T>, f:T->U):Iterable<U>
        return new FuncIterable(() -> new MapIterator(it.iterator(), f));

    /**
        Filters the elements of an iterable using a predicate.

        @param it The iterable to filter the elements of.
        @param pred The filtering predicate.
        @returns The iterable that uses `pred` to filter the elements of `it`.
    **/
    public static function filter<T>(it:Iterable<T>, pred:T->Bool):Iterable<T>
        return new FuncIterable(() -> new FilterIterator(it.iterator(), pred));

    /**
        Adds the 0-based index for each element of an iterable.

        @param it The iterable to add the index of each element for.
        @returns The iterable that contains each element of `it` in an
            `Indexed`.
    **/
    public static function enumerate<T>(it:Iterable<T>):Iterable<Indexed<T>>
        return new FuncIterable(() -> new EnumerateIterator(it.iterator()));

    /**
        Zips together 2 iterables to have a pair iterable.

        @param it1 The first iterable to zip.
        @param it2 The second iterable to zip.
        @returns An iterable that zips together the elements of `it1` and `it2`
            into a `Pair`.
    **/
    public static function zip<T, U>(it1:Iterable<T>, it2:Iterable<U>):Iterable<Pair<T, U>>
        return new FuncIterable(() -> new ZipIterator(it1.iterator(), it2.iterator()));

    /**
        Chains together 2 iterables one after the other.

        @param it1 The first iterable in the chain.
        @param it2 The second iterable to chain.
        @returns An iterable that first contains the elements of `it1`, then the
            elements of `it2`.
    **/
    public static function chain<T>(it1:Iterable<T>, it2:Iterable<T>):Iterable<T>
        return new FuncIterable(() -> new ChainIterator(it1.iterator(), it2.iterator()));

    /**
        Skips the first `n` elements of an iterable.

        @param it The iterable to skip the first `n` elements of `it`.
        @param n The amount of elements to skip.
        @returns An iterable that misses the first `n` elements of `it`.
    **/
    public static function skip<T>(it:Iterable<T>, n:Int):Iterable<T>
        return new FuncIterable(() -> new SkipIterator(it.iterator(), n));

    /**
        Skips the first elements of an iterable, while a predicate is true for
            the elements.

        @param it The iterable to skip the first elements of `it`.
        @param pred The predicate to use when skipping elements.
        @returns An iterable that misses the first elements of `it`, while
            `pred` returns `true`.
    **/
    public static function skipWhile<T>(it:Iterable<T>, pred:T->Bool):Iterable<T>
        return new FuncIterable(() -> new SkipWhileIterator(it.iterator(), pred));

    /**
        Only keeps the first `n` elements of an iterable.

        @param it The iterable to keep the first `n` elements of `it`.
        @param n The amount of elements to keep.
        @returns An iterable that only keeps the first `n` elements of `it`.
    **/
    public static function take<T>(it:Iterable<T>, n:Int):Iterable<T>
        return new FuncIterable(() -> new TakeIterator(it.iterator(), n));

    /**
        Only keeps the first elements of an iterable, while a predicate is true
        for the elements.

        @param it The iterable to keep the first elements of `it`.
        @param pred The predicate to use when keeping elements.
        @returns An iterable that keeps the first elements of `it`, while `pred`
            returns `true`.
    **/
    public static function takeWhile<T>(it:Iterable<T>, pred:T->Bool):Iterable<T>
        return new FuncIterable(() -> new TakeWhileIterator(it.iterator(), pred));

    /**
        Repeatedly applies an accumulator function for the partial result and
        the next element of an iterable.

        @param it The iterable that is fed into the accumulator.
        @param seed The initial partial result.
        @param acc The accumulator function.
        @returns An iterable that contains each element of the accumulation.
    **/
    public static function scanl<T, U>(it:Iterable<T>, seed:U, acc:(U, T) -> U):Iterable<U>
        return new FuncIterable(() -> new ScanlIterator(it.iterator(), seed, acc));

    /**
        Accumulates the elements of an iterable from left to right.

        @param it The iterable that is fed into the accumulator.
        @param seed The initial partial result.
        @param acc The accumulator function.
        @returns The result of the accumulation.
    **/
    public static function foldl<T, U>(it:Iterable<T>, seed:U, acc:(U, T) -> U):U
        return switch (last(scanl(it, seed, acc))) {
            case Some(x): x;
            case None: throw new IteratorException("Impossible!");
        };

    /**
        Flattens a nested iterable structure.

        @param it The nested iterable to flatten.
        @returns The flattened elements of `it`, containing each element of each
            iterable in `it`.
    **/
    public static function flatten<T>(it:Iterable<Iterable<T>>):Iterable<T>
        return new FuncIterable(() -> new FlattenIterator(map(it, i -> i.iterator()).iterator()));

    /**
        Maps the elements of an iterator to multiple other elements that get
        flattened.

        @param it The iterable elements to map.
        @param f The function to transform the elements.
        @returns The elements of `it`, transformed by `f`, flattened into a
            single iterable.
    **/
    public static function flatMap<T, U>(it:Iterable<T>, f:T->Iterable<U>):Iterable<U>
        return flatten(map(it, f));

    /**
        Reverses an iterable.

        @param it The iterable to reverse.
        @returns An iterable that contains the elements of `it`, but in reverse
            order.
    **/
    public static function reverse<T>(it:Iterable<T>):Iterable<T>
        return new FuncIterable(() -> new ReverseIterator(it.iterator()));

    /**
        Groups the elements of an iterable.

        @param it The iterable to group the elements of.
        @param keySel The selector function that selects the grouping key for
            each element.
        @returns An iterable that contains the groups constructed from the
            elements of `it` with the group key selected with `keySel` in
            `Grouping`s.
    **/
    @:generic
    public static function groupBy<K, T>(it:Iterable<T>, keySel:T->K):Iterable<Grouping<K, T>>
        return new FuncIterable(() -> new GroupByIterator(it.iterator(), keySel));
}
