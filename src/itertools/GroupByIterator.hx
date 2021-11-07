package itertools;

/**
    A single grouping.
**/
typedef Grouping<K, T> = {
    var key:K;
    var values:Iterable<T>;

    function iterator():Iterator<T>;
}

/**
    An iterator that groups elements by a key.
**/
@:generic
class GroupByIterator<K, T> {
    final it:Iterator<T>;
    final keySel:T->K;
    var grouping:Map<K, Array<T>> = new Map();
    var groupingIt:KeyValueIterator<K, Array<T>>;

    public function new(it, keySel) {
        this.it = it;
        this.keySel = keySel;
    }

    public function hasNext() {
        this.buildIfNeeded();
        return this.groupingIt.hasNext();
    }

    public function next():Grouping<K, T> {
        this.buildIfNeeded();
        var nxt = this.groupingIt.next();
        return {
            key: nxt.key,
            values: nxt.value,
            iterator: function() return nxt.value.iterator(),
        };
    }

    function buildIfNeeded() {
        if (this.groupingIt != null)
            return;
        while (this.it.hasNext()) {
            var i = this.it.next();
            var k = this.keySel(i);
            var existing = this.grouping.get(k);
            if (existing == null)
                this.grouping.set(k, [i]);
            else
                existing.push(i);
        }
        this.groupingIt = this.grouping.keyValueIterator();
    }
}
