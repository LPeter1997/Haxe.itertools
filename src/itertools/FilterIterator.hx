package itertools;

import haxe.ds.Option;

/**
    An iterator that keeps elements based on a predicate.
**/
class FilterIterator<T> {
    final it:Iterator<T>;
    final pred:T->Bool;
    var peeked:Option<T> = None;

    public function new(it, pred) {
        this.it = it;
        this.pred = pred;
    }

    public function hasNext()
        return this.peekNext().match(Some(_));

    public function next() {
        var p = this.peekNext();
        this.peeked = None;
        return switch (p) {
            case Some(x): x;
            case None: throw new IteratorException("There are no more elements matching the predicate!");
        };
    }

    function peekNext():Option<T> {
        if (this.peeked.match(Some(_)))
            return this.peeked;
        while (this.it.hasNext()) {
            var i = this.it.next();
            if (this.pred(i)) {
                this.peeked = Some(i);
                return this.peeked;
            }
        }
        this.peeked = None;
        return this.peeked;
    }
}
