package itertools;

import haxe.ds.Option;

/**
    An iterator that takes elements as long as a predicate is true.
**/
class TakeWhileIterator<T> {
    final it:Iterator<T>;
    final pred:T->Bool;
    var peeked:Option<T> = None;
    var failed:Bool;

    public function new(it, pred) {
        this.it = it;
        this.pred = pred;
    }

    public function hasNext()
        return !this.failed && this.peekNext().match(Some(_));

    public function next() {
        var p = this.peekNext();
        this.peeked = None;
        return switch (p) {
            case Some(x): x;
            case None: throw new IteratorException("There are no more elements matching the predicate!");
        };
    }

    function peekNext() {
        if (this.peeked.match(Some(_)))
            return this.peeked;
        if (this.it.hasNext()) {
            var i = this.it.next();
            if (this.pred(i)) {
                this.peeked = Some(i);
            }
            else {
                this.failed = true;
                this.peeked = None;
            }
            return this.peeked;
        }
        this.peeked = None;
        return this.peeked;
    }
}
