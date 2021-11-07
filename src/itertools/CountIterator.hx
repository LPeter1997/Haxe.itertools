package itertools;

/**
    An iterator that counts up integers.
**/
class CountIterator {
    var n:Int;
    final step:Int;

    public function new(n, step) {
        this.n = n;
        this.step = step;
    }

    public function hasNext()
        return true;

    public function next() {
        var result = this.n;
        this.n += this.step;
        return result;
    }
}
