<div id="header">
		<div class="header-top">
			<div class="container">
				<div class="pull-left auto-width-left">
					<ul class="top-menu menu-beta l-inline">
						<li><a href="lien-he"><i class="fa fa-home"></i> Đại Học Bách Khoa TPHCM</a></li>
						<li><a href="lien-he"><i class="fa fa-envelope"></i> foodstore@hcmut.edu.vn</a></li>
					</ul>
				</div>
				<div class="pull-right auto-width-right">
					<ul class="top-details menu-beta l-inline">
						<!--<li><a href="#"><i class="fa fa-user"></i>Tài khoản</a></li> -->
						@if(Auth::check())
						<li><a href="">Chào bạn {{Auth::user()->full_name}}</a></li>
						<li><a href="dang-xuat">Đăng Xuất</a></li>
						@else
						<li><a href="dang-ki">Đăng kí</a></li>
						<li><a href="dang-nhap">Đăng nhập</a></li>
						@endif
					</ul>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-top -->
		<div class="header-body">
			<div class="container beta-relative header-flex" style="display: flex;justify-content: space-between;align-items: center;">
				<div class="pull-left">
					<a href="index.html" id="logo"><img src="source/assets/dest/images/logo fs.png" width="80px" alt=""></a>
				</div>
				<div>
					<p style="font-size: 30px;font-weight: 600">Smart Food Court System</p>
				</div>
				<div class="pull-right beta-components space-left ov">
					<div class="space10">&nbsp;</div>
					<div class="beta-comp">
						<form role="search" method="get" id="searchform" action="{{route('search')}}">
					        <input type="text" value="" name="key" id="s"  placeholder="Nhập tên món hoặc giá tiền..." />
					        <button class="fa fa-search" type="submit" id="searchsubmit"></button>
						</form>
					</div>

					<div class="beta-comp">
						@if(Session::has('cart'))


						<div class="cart">
							<div class="beta-select"><i class="fa fa-shopping-cart"></i> Giỏ hàng (@if(Session::has('cart')){{Session('cart')->totalQty}})
								@else Trống @endif <i class="fa fa-chevron-down"></i></div>
							<div class="beta-dropdown cart-body">

								@foreach($product_cart as $product )


								<div class="cart-item">
									<a class="cart-item-delete" href="del-cart/{{$product['item']['id']}}"><i class="fa fa-times"></i></a>
									<div class="media">
										<a class="pull-left" href="#"><img src="source/image/product/{{$product['item']['image']}}" alt=""></a>
										<div class="media-body">
											<span class="cart-item-title">{{$product['item']['name']}}</span>
											
											<span class="cart-item-amount">{{$product['qty']}}*<span>{{$product['item']['unit_price']}}</span></span>
										</div>
									</div>
								</div>
								@endforeach
								<div class="cart-caption">
									<div class="cart-total text-right">Tổng tiền: <span class="cart-total-value">{{Session('cart')->totalPrice}}</span></div>
									<div class="clearfix"></div>

									<div class="center">
										<div class="space10">&nbsp;</div>
										<a href="dat-hang" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
									</div>
								</div>
							</div>
						</div> <!-- .cart -->
						@endif

					</div>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-body -->
		<div class="header-bottom" style="background-color: #0277b8;">
			<div class="container">
				<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
				<div class="visible-xs clearfix"></div>
				<nav class="main-menu">
					<ul class="l-inline ov">
						<li><a href="/laravel/public/index">Trang chủ</a></li>
						<li><a>Sản phẩm</a>
							<ul class="sub-menu">  
							@foreach($loai_sp as $loai)
								<li><a href="loai-san-pham/{{$loai->id}}">{{$loai->name}}</a></li>
								@endforeach 	
							</ul>
						</li>
						<li><a href="gioi-thieu">Giới thiệu</a></li>
						<li><a href="/laravel/public/lien-he">Liên hệ</a></li>
					</ul>
					<div class="clearfix"></div>
				</nav>
			</div> <!-- .container -->
		</div> <!-- .header-bottom -->
	</div> <!-- #header -->