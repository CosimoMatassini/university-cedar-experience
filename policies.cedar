@id("policy0")
permit (
    principal == Student::"student3",
    action == Action::"SubscribeToCourse",
    resource == Course::"course1"
);

@id("policy1")
permit (
    principal,
    action in [Action::"SubscribeToCourse", Action::"UnsubscribeFromCourse"],
    resource
)
when
{ principal.userInformation has id && principal.faculty == resource.faculty };

@id("policy2")
permit (
    principal,
    action == Action::"ReadParticipants",
    resource
)
when { context.isPrincipalSubscribed };

@id("policy3")
permit (
    principal in ProfessorTeam::"admin",
    action in Action::"ReadResource",
    resource
);

@id("policy4")
permit (
    principal in ProfessorTeam::"researcher",
    action in Action::"ResearchDepartmentActions",
    resource
);

@id("policy5")
forbid (
    principal,
    action == Action::"PublishArticle",
    resource
)
when { context.sourceIp != ip("1.2.3.4") || context.sourceIp.isIpv6() };

@id("policy6")
permit (
    principal,
    action == Action::"ReadArticle",
    resource
)
when
{ if context has isPublic then context.isPublic else principal is Professor };

@id("policy7")
forbid (
    principal,
    action == Action::"ReadArticle",
    resource
)
when
{
    resource.title like "*Artificial Intelligence*" ||
    resource.title like "*AI*" ||
    resource.genre == "Artificial Intelligence"
};

@id("policy8")
permit (
    principal,
    action == Action::"DeleteCourse",
    resource
)
when { principal in resource.professors && context.currentYear > resource.year }
unless { context.studentsSubscribedToCourse > 0 };

@id("policy9")
permit (
    principal,
    action == Action::"RemoveStudent",
    resource
)
when { principal in context.course.professors }
unless { resource.weightedAverage.lessThan(decimal("28.0")) };