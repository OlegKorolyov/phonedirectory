<#import "/spring.ftl" as s />

<#function getRootPath>
    <#if !_cachedRootPath??>
        <#local depth = springMacroRequestContext.getRequestUri()?substring(springMacroRequestContext.getContextPath()?length+1)?split("/")?size/>
        <#local result = ""/>
        <#if depth gt 1>
            <#list 2..depth as i>
                <#local result = result+"../"/>
            </#list>
        </#if>
        <#assign _cachedRootPath = result/>
    </#if>
    <#return _cachedRootPath/>
</#function>

<#function getUrl path absolute=true>
    <#if absolute>
        <#return springMacroRequestContext.getContextUrl(path)/>
    <#else>
        <#if path?starts_with("/")>
            <#local path = path?substring(1)/>
        </#if>
        <#return getRootPath()+path />
    </#if>
</#function>


<#-- Relative path to the root of the web application starting from the current request path -->
<#macro root>
${getRootPath()}<#t/>
</#macro>

<#-- Relative path to the given context-base url. Replacement of <@spring.url/> returning the absolute path -->
<#macro url path>
${getUrl(path)}<#t/>
</#macro>