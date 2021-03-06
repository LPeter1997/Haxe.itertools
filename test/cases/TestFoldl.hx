package cases;

import utest.Assert;
using itertools.Extensions;

class TestFoldl extends Test {
    public function new() {}

    function testEmpty() {
        var r = [].foldl(0, (x, y) -> x + y);
        Assert.isTrue(r == 0);
    }

    function testSum() {
        var r = [1, 2, 3, 4].foldl(0, (x, y) -> x + y);
        Assert.isTrue(r == 10);
    }
}
