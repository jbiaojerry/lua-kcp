
# LUA-INTERFACE

## LKcp.create(session, func)

### DESCRIPTION
    Create kcp object.

### PARAMETERS
    session: number mark session 
    func: extra closures, which KCP layer invoke callback to send data, see detail in testkcp.lua

### RETURN
    kcp: kcp object

## kcp:wndsize(sndwnd, rcvwnd)

### DESCRIPTION
    Set maximum window size: sndwnd=32, rcvwnd=32 by default

### PARAMETERS
    sndwnd: send window size
    rcvwnd: recive window size

### RETURN
    None

## kcp:nodelay(nodelay, interval, resend, nc)

### DESCRIPTION
    Config re-transmission and flow control

### PARAMETERS
    nodelay: 0:disable(default), 1:enable
    interval: internal update timer interval in millisec, default is 100ms 
    resend: 0:disable fast resend(default), 1:enable fast resend
    nc: 0:normal congestion control(default), 1:disable congestion control

### RETURN
    ret: always 0

## kcp:check(current)

### DESCRIPTION
    Get when to invoke update

### PARAMETERS
    current: current timestamp in millisec

### RETURN
    when: timestamp in millisec when to invoke update 

## kcp:update(current)

### DESCRIPTION
    Update state (call it repeatedly, every 10ms-100ms), or you can ask 

### PARAMETERS
    current: current timestamp in millisec

### RETURN
    None

## kcp:send(data)

### DESCRIPTION
    User/upper level send

### PARAMETERS
    data: data to be sent

### RETURN
    sent_len: below zero for error, otherwise succeed

## kcp:flush()

### DESCRIPTION
    Flush pending data

### PARAMETERS
    None

### RETURN
    None

## kcp:input(data)

### DESCRIPTION
    When you received a low level packet (eg. UDP packet), call it

### PARAMETERS
    data: data received from transport layer

### RETURN
    ret: below zero for error, otherwise succeed 

## kcp:recv()

### DESCRIPTION
    User/upper level recv 

### PARAMETERS
    None

### RETURN
    rcv_len: Less than or equal to 0 for EAGAIN, otherwise for rcv_len 
    rcv_buf: if rcv_len greater than 0, rcv_buf is data to recv

## kcp:setminrto(minrto)

### DESCRIPTION
    Config the minmum RTO.

### PARAMETERS
    minrto: Minmum RTO

### RETURN
	None

## kcp:peeksize()

### DESCRIPTION
	check the size of next message in the recv queue

### PARAMETERS
	None

### RETURN
	size of next message in the recv queue

## kcp:setmtu(mtu)

### DESCRIPTION
    change MTU size, default is 1400

### PARAMETERS
    mtu: new MTU size

### RETURN
	rc: 0 for sucess, -1 invalid mtu, -2 cannot alloc overhead buffer

## kcp:waitsnd()

### DESCRIPTION
	get how many packet is waiting to be sent

### PARAMETERS
	None

### RETURN
	packet size


## kcp:getconv()

### DESCRIPTION
	read conv

### PARAMETERS
	None

### RETURN
	conv


