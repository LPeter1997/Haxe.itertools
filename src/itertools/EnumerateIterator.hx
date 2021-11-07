package itertools;

/**
    A pair of index and element.
**/
typedef Indexed<T> = {
    index:Int,
    item:T,
}

/**
    An iterator that includes the index for each element.
**/
class EnumerateIterator<T> {
    final it:Iterator<T>;
    var idx:Int = 0;

    public function new(it) {
        this.it = it;
    }

    public function hasNext()
        return this.it.hasNext();

    public function next():Indexed<T>
        return {index: this.idx++, item: this.it.next()};
}
