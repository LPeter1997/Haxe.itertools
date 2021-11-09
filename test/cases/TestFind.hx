package cases;

import utest.Assert;
using itertools.Extensions;

class TestFind extends Test {
    public function new() {}

    function testEmpty() {
        var f = [].find(x -> true);
        Assert.isTrue(f.match(None));
    }

    function testNoMatch() {
        var f = [2, 4, 6].find(x -> x % 2 != 0);
        Assert.isTrue(f.match(None));
    }

    function testFirstMatch() {
        var f = [1, 2, 3].find(x -> x % 2 != 0);
        Assert.isTrue(f.match(Some(1)));
    }

    function testLastMatch() {
        var f = [2, 0, 3].find(x -> x % 2 != 0);
        Assert.isTrue(f.match(Some(3)));
    }
}
