const Student = artifacts.require("Student");

contract("Student", () => {
    let student = null;
    before( async() => {
        student = await Student.deployed();
    })

    it("Check create function", async ()=> {
        await student.create(
            "ST123", "xian","yu",1,0
        );
        const result = await student.getStudentInfoByStudentId("ST123");

        // 0 -> studentId
        // 1 -> firstName
        // 2 -> lastName
        // ..
        assert.equal(result[1],"xian");
    }),
    it("Check update function", async ()=> {
        await student.update(
            "ST1", "haha","yu",1,0
        );
        const result = await student.getStudentInfoByStudentId("ST1");

        // 0 -> studentId
        // 1 -> firstName
        // 2 -> lastName
        // ..
        assert.equal(result[1],"haha");
    }),
    it("Check update course function", async ()=> {
        await student.updateCourse(
            "ST1", 2
        );
        const result = await student.getStudentInfoByStudentId("ST1");

        // 0 -> studentId
        // 1 -> firstName
        // 2 -> lastName
        // ..
        assert.equal(result[4],2);
    })

});