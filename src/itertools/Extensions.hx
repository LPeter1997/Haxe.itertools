package itertools;

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
		Attempts to find the first element in an iterator that matches the given predicate.
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
		Creates a `ZipIterator`.
	**/
	public static function zip<T, U>(it1:Iterator<T>, it2:Iterator<U>):Iterator<Pair<T, U>>
		return new ZipIterator(it1, it2);
}
