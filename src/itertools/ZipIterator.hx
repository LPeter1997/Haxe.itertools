package itertools;

/**
    A pair of zipped elements.
**/
typedef Pair<T, U> = {
    first:T,
    second:U,
}

/**
    An iterator making a pair iterator from two other iterators.
**/
class ZipIterator<T, U> {
    final it1:Iterator<T>;
    final it2:Iterator<U>;

    public function new(it1, it2) {
        this.it1 = it1;
        this.it2 = it2;
    }

    public function hasNext()
        return this.it1.hasNext() && this.it2.hasNext();

    public function next():Pair<T, U>
        return {first: this.it1.next(), second: this.it2.next()};
}
