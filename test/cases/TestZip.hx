package cases;

import utest.Assert;
using itertools.Extensions;

class TestZip extends Test {
	public function new() {}

	function testSameLen() {
		var r = [1, 2, 3].iterator().zip([4, 5, 6].iterator());
		Assert.isTrue(switch (r.next()) { case {first: 1, second:4}: true; case _: false; });
		Assert.isTrue(switch (r.next()) { case {first: 2, second:5}: true; case _: false; });
		Assert.isTrue(switch (r.next()) { case {first: 3, second:6}: true; case _: false; });
        Assert.isFalse(r.hasNext());
	}

    function testFirstShorter() {
		var r = [1, 2, 3].iterator().zip([4, 5, 6, 7].iterator());
		Assert.isTrue(switch (r.next()) { case {first: 1, second:4}: true; case _: false; });
		Assert.isTrue(switch (r.next()) { case {first: 2, second:5}: true; case _: false; });
		Assert.isTrue(switch (r.next()) { case {first: 3, second:6}: true; case _: false; });
        Assert.isFalse(r.hasNext());
	}

    function testSecondShorter() {
		var r = [1, 2, 3, 4].iterator().zip([4, 5, 6].iterator());
		Assert.isTrue(switch (r.next()) { case {first: 1, second:4}: true; case _: false; });
		Assert.isTrue(switch (r.next()) { case {first: 2, second:5}: true; case _: false; });
		Assert.isTrue(switch (r.next()) { case {first: 3, second:6}: true; case _: false; });
        Assert.isFalse(r.hasNext());
	}
}
