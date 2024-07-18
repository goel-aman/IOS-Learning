struct Payment {
    var debitCardPayment: DebitCardPayment?
    var stripePayment: StripePayment?
    var applePayPayment: ApplePayPayment?
}

struct DebitCardPayment {
    func execute(amount: Double) {
        print("Debit card payment success for \(amount)")
    }
}

struct StripePayment {
    func execute(amount: Double) {
        print("stripe payment success for \(amount)")
    }
}

struct ApplePayPayment {
    func execute(amount: Double) {
        print("ApplePayPayment payment success for \(amount)")
    }
}

// this doesn't follow Dependency inversion principle.
// Over here a high level module i.e. Payment() is dependant on a low level modules DebitCardPayment, StripePayment, ApplePayPayment

// let say we wanna do debit card payment
let paymentMethod = DebitCardPayment()
let payment = Payment(debitCardPayment: paymentMethod, stripePayment: nil, applePayPayment: nil)


// if we are calling the below methods we don't exactly know which payment method is know just by seeing the line written below
payment.debitCardPayment?.execute(amount: 200)

// someone can accidently call the code written below:
payment.stripePayment?.execute(amount: 200)


// instead we want to depend on abstraction.

protocol processPayment {
    func execute(amount: Double)
}

struct PaymentDIP {
    let paymentType: processPayment
    
    func processPayment(amount: Double) {
        paymentType.execute(amount: amount)
    }
}

struct DebitCardPaymentDIP: processPayment {
    func execute(amount: Double) {
        print("Debit card payment success for \(amount)")
    }
}

struct StripePaymentDIP: processPayment {
    func execute(amount: Double) {
        print("stripe payment success for \(amount)")
    }
}

struct ApplePayPaymentDIP: processPayment {
    func execute(amount: Double) {
        print("ApplePayPayment payment success for \(amount)")
    }
}



let stripePay = StripePaymentDIP()
let pay = PaymentDIP(paymentType: stripePay)
pay.processPayment(amount: 20)

