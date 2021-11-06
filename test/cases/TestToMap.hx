package cases;

import utest.Assert;
using itertools.Extensions;

class TestToMap extends Test {
	public function new() {}

	function testEmpty() {
        var a: Array<Int> = [];
		var i = a.iterator().toMap(x -> x);
        Assert.isTrue(i.keys().count() == 0);
	}

    function testNotEmptyWithoutValueSelector() {
		var i = [1, 2, 3].iterator().toMap(i -> '$i');
        Assert.isTrue(i["1"] == 1);
        Assert.isTrue(i["2"] == 2);
        Assert.isTrue(i["3"] == 3);
	}

    function testNotEmptyWithValueSelector() {
		var i = [1, 2, 3].iterator().toMapProj(i -> '$i', i -> i * 2);
        Assert.isTrue(i["1"] == 2);
        Assert.isTrue(i["2"] == 4);
        Assert.isTrue(i["3"] == 6);
	}
}
