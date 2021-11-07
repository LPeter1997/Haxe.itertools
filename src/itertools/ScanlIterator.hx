package itertools;

/**
    An iterator that applies a reduction each step, accumulating the results.
**/
class ScanlIterator<T, U> {
    final it:Iterator<T>;
    final acc:(U, T) -> U;
    var seed:U;
    var hasSeed:Bool;

    public function new(it, seed, acc) {
        this.it = it;
        this.acc = acc;
        this.seed = seed;
        this.hasSeed = true;
    }

    public function hasNext()
        return this.hasSeed;

    public function next() {
        var result = this.seed;
        if (it.hasNext()) {
            this.seed = this.acc(this.seed, it.next());
        } else {
            this.hasSeed = false;
        }
        return result;
    }
}
