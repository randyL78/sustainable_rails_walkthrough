const jsdom = require("jsdom")
const { JSDOM } = jsdom

test("clicking on a rating manipulates the DOM", done => {
    // mock just enough of the dom to mimic what we need
    const dom = new JSDOM(`
    <div data-no-rating-present>
        Shown when there is no rating.        
    </div>
    <div data-rating-present class="dn">
        Shown when there IS a rating
        <span data-rating-label></span>
    </div>
    
    <input type="submit" data-rating value="1">
    <input type="submit" data-rating value="2">
    `)

    // grab the objects that will be modified by the JS
    const document = dom.window.document
    const whenRatingPresent = document.querySelector("[data-rating-present]")
    const whenNoRatingPresent = document.querySelector("[data-no-rating-present]")
    const ratingLabel = document.querySelector("[data-rating-label]")
    const rating2Button = document.querySelector("[data-rating][value='2']")

    // require the JS code we will be testing
    require("widget_ratings").start(dom.window)

    dom.window.addEventListener("DOMContentLoaded", () => {
        rating2Button.click()

        // assertions
        try {
            expect(whenRatingPresent.classList.contains("db")).toBe(true)
            expect(whenNoRatingPresent.classList.contains("dn")).toBe(true)
            expect(ratingLabel.innerText).toBe("2")
            done()
        } catch (error) {
            done(error)
        }
    })
})
