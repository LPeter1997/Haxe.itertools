package itertools;

/**
    Basic iterables.
**/
class Basic {
    /**
        Creates an iterable, that counts indefinitely.

        @param start The number to start counting from.
        @param step The amount to step by.
        @returns An iterable that first yields `start`, then is offset by `step`
            each time.
    **/
    public static function count(start:Int = 0, step:Int = 1):Iterable<Int>
        return new FuncIterable(() -> new CountIterator(start, step));

    /**
        Creates an iterable, that repeats an element indefinitely.

        @param element The element to repeat.
        @returns An iterable, that repeats `element` forever.
    **/
    public static function repeat<T>(element:T):Iterable<T>
        return new FuncIterable(() -> new RepeatIterator(element));

    /**
        Creates an iterable, that yields no elements.

        @returns An iterable, that has no elements.
    **/
    public static function empty<T>():Iterable<T>
        return new FuncIterable(() -> new EmptyIterator());

    /**
        Creates an iterable, that contains a single element.

        @param element The element to return from the iterable.
        @returns An iterable, that yields `element` once.
    **/
    public static function one<T>(element:T):Iterable<T>
        return Extensions.take(repeat(element), 1);
}
