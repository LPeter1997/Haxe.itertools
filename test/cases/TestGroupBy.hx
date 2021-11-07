package cases;

import utest.Assert;
using itertools.Extensions;

class TestGroupBy extends Test {
    public function new() {}

    function testEmpty() {
        var r = [].iterator().groupBy(x -> x % 3);
        Assert.isFalse(r.hasNext());
    }

    function testNotEmpty() {
        var r = [1, 2, 3, 5, 6, 6, 4, 7, 2]
            .iterator()
            .groupBy(x -> x % 3)
            .toMapProj(g -> g.key, g -> g.values.iterator().toArray());

        Assert.isTrue(r[0].length == 3);
        Assert.isTrue(r[1].length == 3);
        Assert.isTrue(r[2].length == 3);

        Assert.isTrue(r[0][0] == 3);
        Assert.isTrue(r[0][1] == 6);
        Assert.isTrue(r[0][2] == 6);

        Assert.isTrue(r[1][0] == 1);
        Assert.isTrue(r[1][1] == 4);
        Assert.isTrue(r[1][2] == 7);

        Assert.isTrue(r[2][0] == 2);
        Assert.isTrue(r[2][1] == 5);
        Assert.isTrue(r[2][2] == 2);
    }
}
