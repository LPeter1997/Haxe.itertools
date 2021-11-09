package cases;

import itertools.Basic;
import utest.Assert;
using itertools.Extensions;

class TestCountIt extends Test {
    public function new() {}

    function testDefault() {
        var c = Basic.count().iterator();
        Assert.isTrue(c.next() == 0);
        Assert.isTrue(c.next() == 1);
        Assert.isTrue(c.next() == 2);
    }

    function testFrom5() {
        var c = Basic.count(5).iterator();
        Assert.isTrue(c.next() == 5);
        Assert.isTrue(c.next() == 6);
        Assert.isTrue(c.next() == 7);
    }

    function testFrom5Step2() {
        var c = Basic.count(5, 2).iterator();
        Assert.isTrue(c.next() == 5);
        Assert.isTrue(c.next() == 7);
        Assert.isTrue(c.next() == 9);
    }
}
