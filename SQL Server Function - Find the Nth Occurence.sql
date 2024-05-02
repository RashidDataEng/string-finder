CREATE FUNCTION dbo.FindNthOccurrence (
    @StringToSearch NVARCHAR(MAX),
    @SearchString NVARCHAR(MAX),
    @N INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Position INT = 0;
    DECLARE @Count INT = 0;
    DECLARE @Result INT = -1;

    WHILE @Count < @N AND @Position < LEN(@StringToSearch)
    BEGIN
        SET @Position = CHARINDEX(@SearchString, @StringToSearch, @Position + 1);
        IF @Position > 0
        BEGIN
            SET @Count = @Count + 1;
            SET @Result = @Position;
        END;
    END;

    RETURN @Result;
END;