package itertools;

import haxe.ds.Option;

/**
    An iterator that flattens an iterator of iterators.
**/
class FlattenIterator<T> {
    final it:Iterator<Iterator<T>>;
    var peeked:Option<Iterator<T>> = None;

    public function new(it) {
        this.it = it;
    }

    public function hasNext()
        return this.peekNext().match(Some(_));

    public function next() {
        var p = this.peekNext();
        return switch (p) {
            case Some(x): x.next();
            case None: throw new IteratorException("There are no more elements to flatten!");
        }
    }

    function peekNext() {
        switch (this.peeked) {
            case Some(x) if (x.hasNext()):
                return this.peeked;
            case _:
        }
        while (this.it.hasNext()) {
            var i = this.it.next();
            if (i.hasNext()) {
                this.peeked = Some(i);
                return this.peeked;
            }
        }
        this.peeked = None;
        return this.peeked;
    }
}
