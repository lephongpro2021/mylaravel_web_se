@extends('master')
@section('content')
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Đặt hàng</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb">
                <a href="index">Trang chủ</a> / <span>Đặt hàng</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="container">
    <div id="content">  
        <form action="{{route('dathang')}}" method="post" class="beta-form-checkout">
            <input type="hidden" name="_token" value="{{csrf_token()}}">
            <div class="row" >@if (Session::has('thongbao'))
                    <div class="alert alert-success">{{Session::get('thongbao')}}</div>
                    @endif
            <div class="row">
                <div class="col-sm-6">
                    <h4>Đặt hàng</h4>
                    <div class="space20">&nbsp;</div>

                    <div class="form-block">
                        <label for="name">Họ tên*</label>
                        <input type="text" id="name" name="name" placeholder="Họ tên" required>
                    </div>
                    <div class="form-block">
                        <label>Giới tính </label>
                        <input id="gender" type="radio" class="input-radio" name="gender" value="nam" checked="checked" style="width: 10%"><span style="margin-right: 10%">Nam</span>
                        <input id="gender" type="radio" class="input-radio" name="gender" value="nữ" style="width: 10%"><span>Nữ</span>
                                    
                    </div>

                    <div class="form-block">
                        <label for="email">Email*</label>
                        <input type="email" id="email" name="email" required placeholder="expample@gmail.com">
                    </div>

                    <div class="form-block">
                        <label for="adress">Địa chỉ*</label>
                        <input type="text" id="address" name="address" placeholder="Street Address" required>
                    </div>
                    

                    <div class="form-block">
                        <label for="phone">Điện thoại*</label>
                        <input type="text" id="phone" name="phone" required>
                    </div>
                    
                    <div class="form-block">
                        <label for="notes">Ghi chú</label>
                        <textarea id="notes" name="notes"></textarea>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="your-order">
                        <div class="your-order-head"><h5>Đơn hàng của bạn</h5></div>
                        <div class="your-order-body" style="padding: 0px 10px">
                            <div class="your-order-item">
                                <div>
                                    @if(Session::has('cart'))
                                    @foreach($product_cart as $cart)
                                <!--  one item   -->
                                    <div class="media">
                                        <img width="25%" src="source/image/product/{{$cart['item']['image']}}" alt="" class="pull-left">
                                        <div class="media-body">
                                            <p class="font-large">{{$cart['item']['name']}}</p>
                                            <span class="color-gray your-order-info">Đơn giá: {{number_format($cart['price'])}} đồng </span>
                                            <span class="color-gray your-order-info">Số lượng: {{$cart['qty']}}</span>
                                        </div>
                                    </div>
                                    @endforeach
                                    @endif
                                <!-- end one item -->
                                </div>
            
                                <div class="clearfix"></div>
                            </div>
                            <div class="your-order-item">
                                <div class="pull-left"><p class="your-order-f18">Tổng tiền:</p></div>

                                <div class="pull-right"><h5 class="color-black">@if(Session::has('cart')){{number_format($totalPrice)}}@endif đồng</h5></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="your-order-head"><h5>Hình thức thanh toán</h5></div>
                        
                        <div class="your-order-body">
                            <ul class="payment_methods methods">
                                <li class="payment_method_bacs">
                                    <input id="payment_method_bacs" type="radio" class="input-radio"  value="COD" checked="checked" data-order_button_text="" name="payment">
                                    <label for="payment_method_bacs">Thanh toán tại quầy </label>
                                    <div class="payment_box payment_method_bacs" style="display: block;">
                                        Khi đồ ăn của bạn chuẩn bị xong, sẽ có thông báo để bạn đến quầy nhận và thanh toán tại quầy.
                                    </div>                      
                                </li>

                                <li class="payment_method_cheque">
                                    <input id="payment_method_cheque" type="radio" class="input-radio"  value="ATM" name="payment" data-order_button_text="">
                                    <label for="payment_method_cheque">Thanh toán qua ví điện tử </label>
                                    <div class="payment_box payment_method_cheque" style="display: none;">
                                        Sau khi thanh toán thành công, bạn đợi đến khi có thông báo để đến quầy nhận hàng.
                                    </div>                      
                                </li>
                                
                            </ul>
                        </div>

                        <div class="text-center"><button type="submit" class="beta-btn primary" href="#">Đặt hàng <i class="fa fa-chevron-right"></i></button></div>
                    </div> <!-- .your-order -->
                </div>
            </div>
        </form>
    </div> <!-- #content -->
</div> <!-- .container -->
@endsection