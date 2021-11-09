package itertools;

/**
    An iterator that skips the first n elements.
**/
class SkipIterator<T> {
    final it:Iterator<T>;
    var n:Int;

    public function new(it, n) {
        this.it = it;
        this.n = n;
    }

    public function hasNext() {
        this.skipIfNeeded();
        return this.it.hasNext();
    }

    public function next() {
        this.skipIfNeeded();
        return this.it.next();
    }

    function skipIfNeeded() {
        if (this.n > 0) {
            Extensions.nth(new FuncIterable(() -> it), this.n - 1);
            this.n = 0;
        }
    }
}
