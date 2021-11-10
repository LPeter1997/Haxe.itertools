package itertools;

/**
    An iterable that can only be used once.
**/
class OnceIterable<T> {
    final it:Iterable<T>;
    var used:Bool = false;

    public function new(it) {
        this.it = it;
    }

    public function iterator() {
        if (this.used)
            throw new IteratorException("The iterable is already iterated!");
        this.used = true;
        return this.it.iterator();
    }
}
