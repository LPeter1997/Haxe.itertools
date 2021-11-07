package itertools;

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
		Collects the elements of an iterator to an `Array`.
	**/
	public static function toArray<T>(it:Iterator<T>):Array<T> {
		var result = new Array();
		while (it.hasNext())
			result.push(it.next());
		return result;
	}

	/**
		Collects the elements of an iterator to a `Map` with a given key and value
		selector.
	**/
	@:generic
	public static function toMapProj<T, K, V>(it:Iterator<T>, keySel:T->K, valSel:T->V):Map<K, V> {
		var result = new Map<K, V>();
		while (it.hasNext()) {
			var i = it.next();
			result.set(keySel(i), valSel(i));
		}
		return result;
	}

	/**
		Collects the elements of an iterator to a `Map` with a given key selector.
	**/
	@:generic
	public static function toMap<T, K>(it:Iterator<T>, keySel:T->K):Map<K, T> {
		var result = new Map<K, T>();
		while (it.hasNext()) {
			var i = it.next();
			result.set(keySel(i), i);
		}
		return result;
	}

	/**
		Joins iterator elements with a separator into a string.
	**/
	public static function join<T>(it:Iterator<T>, sep:String):String {
		var result = new StringBuf();
		if (it.hasNext()) {
			var first = it.next();
			result.add(first);
			while (it.hasNext()) {
				var rest = it.next();
				result.add(sep);
				result.add(rest);
			}
		}
		return result.toString();
	}

	/**
		Retrieves the first element of an iterator, if any.
	**/
	public static function first<T>(it:Iterator<T>):Option<T>
		return if (it.hasNext()) Some(it.next()) else None;

	/**
		Retrieves the last element of an iterator, if any.
	**/
	public static function last<T>(it:Iterator<T>):Option<T> {
		var l = None;
		while (it.hasNext())
			l = Some(it.next());
		return l;
	}

	/**
		Retrieves the nth element of an iterator, if any.
	**/
	public static function nth<T>(it:Iterator<T>, n:Int):Option<T> {
		while (n > 0 && it.hasNext()) {
			it.next();
			--n;
		}
		return if (it.hasNext()) Some(it.next()) else None;
	}

	/**
		Checks, if a given predicate is true for all elements of an iterator.
	**/
	public static function all<T>(it:Iterator<T>, pred:T->Bool):Bool {
		while (it.hasNext()) {
			var i = it.next();
			if (!pred(i))
				return false;
		}
		return true;
	}

	/**
		Checks, if a given predicate is true for any element of an iterator.
	**/
	public static function any<T>(it:Iterator<T>, pred:T->Bool):Bool {
		while (it.hasNext()) {
			var i = it.next();
			if (pred(i))
				return true;
		}
		return false;
	}

	/**
		Counts the number of elements in an iterator.
	**/
	public static function count<T>(it:Iterator<T>):Int {
		var cnt = 0;
		while (it.hasNext()) {
			it.next();
			++cnt;
		}
		return cnt;
	}

	/**
		Attempts to find the first element in an iterator that matches the given
		predicate.
	**/
	public static function find<T>(it:Iterator<T>, pred:T->Bool):Option<T> {
		while (it.hasNext()) {
			var i = it.next();
			if (pred(i))
				return Some(i);
		}
		return None;
	}

	/**
		Creates an iterator that filters and maps an iterator by transforming to
		an `Optional<U>`, and only keeping `Some(U)`.
	**/
	public static function filterMap<T, U>(it:Iterator<T>, f:T->Option<U>):Iterator<U>
		return map(filter(map(it, f), x -> switch (x) {
			case Some(x): true;
			case None: false;
		}), x -> switch (x) {
			case Some(x): x;
			case None: throw new IteratorException("Impossible!");
		});

	/**
		Creates a `MapIterator`.
	**/
	public static function map<T, U>(it:Iterator<T>, f:T->U):Iterator<U>
		return new MapIterator(it, f);

	/**
		Creates a `FilterIterator`.
	**/
	public static function filter<T>(it:Iterator<T>, pred:T->Bool):Iterator<T>
		return new FilterIterator(it, pred);

	/**
		Creates an `EnumerateIterator`.
	**/
	public static function enumerate<T>(it:Iterator<T>):Iterator<Indexed<T>>
		return new EnumerateIterator(it);

	/**
		Creates a `ZipIterator`.
	**/
	public static function zip<T, U>(it1:Iterator<T>, it2:Iterator<U>):Iterator<Pair<T, U>>
		return new ZipIterator(it1, it2);

	/**
		Creates a `ChainIterator`.
	**/
	public static function chain<T>(it1:Iterator<T>, it2:Iterator<T>):Iterator<T>
		return new ChainIterator(it1, it2);

	/**
		Creates a `SkipIterator`.
	**/
	public static function skip<T>(it:Iterator<T>, n:Int):Iterator<T>
		return new SkipIterator(it, n);

	/**
		Creates a `SkipWhileIterator`.
	**/
	public static function skipWhile<T>(it:Iterator<T>, pred:T->Bool):Iterator<T>
		return new SkipWhileIterator(it, pred);

	/**
		Creates a `TakeIterator`.
	**/
	public static function take<T>(it:Iterator<T>, n:Int):Iterator<T>
		return new TakeIterator(it, n);

	/**
		Creates a `TakeWhileIterator`.
	**/
	public static function takeWhile<T>(it:Iterator<T>, pred:T->Bool):Iterator<T>
		return new TakeWhileIterator(it, pred);

	/**
		Creates a `ScanlIterator`.
	**/
	public static function scanl<T, U>(it:Iterator<T>, seed:U, acc:(U, T) -> U):Iterator<U>
		return new ScanlIterator(it, seed, acc);

	/**
		Folds left the elements of an iterator using an accumulator function.
	**/
	public static function foldl<T, U>(it:Iterator<T>, seed:U, acc:(U, T) -> U):U
		return switch (last(scanl(it, seed, acc))) {
			case Some(x): x;
			case None: throw new IteratorException("Impossible!");
		};

	/**
		Creates a `FlattenIterator`.
	**/
	public static function flatten<T>(it:Iterator<Iterator<T>>):Iterator<T>
		return new FlattenIterator(it);

	/**
		Maps the elements of an iterator to multiple other elements that get
		flattened.
	**/
	public static function flatMap<T, U>(it:Iterator<T>, f:T->Iterator<U>):Iterator<U>
		return flatten(map(it, f));

	/**
		Creates a `ReverseIterator`.
	**/
	public static function reverse<T>(it:Iterator<T>):Iterator<T>
		return new ReverseIterator(it);
}
