package itertools;

/**
    Basic iterators.
**/
class Iterators {
    /**
        Creates a `CountIterator`.
    **/
	public static function count(start:Int, step:Int = 1):Iterator<Int>
		return new CountIterator(start, step);

    /**
        Creates a `RepeatIterator`.
    **/
    public static function repeat<T>(element:T):Iterator<T>
        return new RepeatIterator(element);
}
