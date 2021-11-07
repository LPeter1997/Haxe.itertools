package itertools;

/**
    An iterator that chains two iterators one after the other.
**/
class ChainIterator<T> {
    final it1:Iterator<T>;
    final it2:Iterator<T>;

    public function new(it1, it2) {
        this.it1 = it1;
        this.it2 = it2;
    }

    public function hasNext()
        return this.it1.hasNext() || this.it2.hasNext();

    public function next()
        return if (this.it1.hasNext()) this.it1.next() else this.it2.next();
}
