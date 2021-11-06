package cases;

import utest.Assert;
using itertools.Extensions;

class TestChain extends Test {
	public function new() {}

	function testTwoEmptys() {
		var i = [].iterator().chain([].iterator());
        Assert.isFalse(i.hasNext());
	}

    function testFirstEmptySecondSingle() {
		var i = [].iterator().chain([1].iterator());
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
	}

	function testFirstSingleSecondEmpty() {
		var i = [1].iterator().chain([].iterator());
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
        Assert.isFalse(i.hasNext());
	}

	function testBothSingle() {
		var i = [1].iterator().chain([2].iterator());
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
		Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
        Assert.isFalse(i.hasNext());
	}

	function testBothMany() {
		var i = [1, 2, 3].iterator().chain([4, 5, 6].iterator());
        Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 1);
		Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 2);
		Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 3);
		Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 4);
		Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 5);
		Assert.isTrue(i.hasNext());
        Assert.isTrue(i.next() == 6);
        Assert.isFalse(i.hasNext());
	}
}
