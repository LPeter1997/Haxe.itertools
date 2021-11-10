package cases;

import itertools.FuncIterable;
import utest.Assert;
using itertools.Extensions;

class TestToMap extends Test {
    public function new() {}

    function testEmpty() {
        var a: Array<Int> = [];
        var i = a.toMap(x -> x);
        Assert.isTrue(Extensions.asOnceIterable(i.keys()).count() == 0);
    }

    function testNotEmptyWithoutValueSelector() {
        var i = [1, 2, 3].toMap(i -> '$i');
        Assert.isTrue(i["1"] == 1);
        Assert.isTrue(i["2"] == 2);
        Assert.isTrue(i["3"] == 3);
    }

    function testNotEmptyWithValueSelector() {
        var i = [1, 2, 3].toMapProj(i -> '$i', i -> i * 2);
        Assert.isTrue(i["1"] == 2);
        Assert.isTrue(i["2"] == 4);
        Assert.isTrue(i["3"] == 6);
    }
}
